terraform {
  backend "s3" {
    bucket = "levio-aws-demo-fev-terraform"
    key    = "states/estaec.tfstate"
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
      Environment = "dev"
      Project     = "estaec"
    }
  }
}

resource "aws_s3_bucket" "deploy" {
  bucket = "estaec-deployment"
}

resource "aws_s3_bucket_policy" "dev_bucket_policy" {
  bucket = aws_s3_bucket.deploy.id
  policy = data.aws_iam_policy_document.allow_public_read_of_deployment_dev_folder.json
}

data "aws_iam_policy_document" "allow_public_read_of_deployment_dev_folder" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    sid    = "AllowPublicReadOfDeploymentFolders"
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.deploy.arn}/deployment/dev/*"
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
      replace_key_prefix_with = "deployment/dev/"
    }
  }
}
