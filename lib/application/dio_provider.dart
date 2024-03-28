import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'dio_provider.g.dart';

const apiUri = 'https://yihxn1ubcd.execute-api.us-east-1.amazonaws.com/dev';
@riverpod
Dio dio(DioRef ref) {
  var dio = Dio(
    BaseOptions(
      baseUrl: apiUri,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      persistentConnection: false,
    ),
  );

  var sessionId = const Uuid().v4();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final authSession = await Amplify.Auth.fetchAuthSession() as CognitoAuthSession;
        options.headers.addAll(
          {
            'Authorization': authSession.userPoolTokensResult.value.idToken.raw,
            'X-Session-Id': sessionId,
          },
        );
        return handler.next(options);
      },
    ),
  );
  return dio;
}
