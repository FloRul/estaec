terraform {
  backend "s3" {
    bucket = "levio-aws-demo-fev-terraform"
    key    = "states/estaec-staging.tfstate"
    region = "us-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Terraform   = true
      Environment = var.environment
      Project     = "estaec"
    }
  }
}

resource "aws_s3_bucket" "deploy" {
  bucket = "estaec-deployment-${var.environment}"
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.deploy.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  depends_on = [aws_s3_bucket_public_access_block.this]
  bucket     = aws_s3_bucket.deploy.id
  policy     = data.aws_iam_policy_document.allow_public_read_of_deployment_folder.json
}

data "aws_iam_policy_document" "allow_public_read_of_deployment_folder" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    sid    = "AllowPublicReadOfDeploymentFolders"
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.deploy.arn}/deployment/*"
    ]

    actions = [
      "s3:GetObject",
    ]
  }
  statement {
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::446872271111:user/terraform-provisionner"]
    }
    sid    = "AllowAll"
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.deploy.arn}/*",
      "${aws_s3_bucket.deploy.arn}"
    ]

    actions = [
      "s3:*",
    ]
  }
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.deploy.id

  index_document {
    suffix = "index.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "*/*"
    }
    redirect {
      replace_key_prefix_with = "deployment/"
    }
  }
}
