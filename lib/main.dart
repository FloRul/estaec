// ignore_for_file: depend_on_referenced_packages

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:estaec/amplifyconfiguration.dart';
import 'package:estaec/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _configureAmplify() async {
  try {
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugins([auth]);
    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    print('Error configuring Amplify: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      authenticatorBuilder: (context, state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return Scaffold(
              appBar: AppBar(title: const Text('ESTAEC - Connexion')),
              body: Center(
                child: SizedBox(
                  width: 400,
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SignInForm(),
                  ),
                ),
              ),
            );
          default:
            return null;
        }
      },
      child: MaterialApp.router(
        routerConfig: _router,
        theme: ThemeData.from(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff8bc540),
            secondary: const Color(0xff03494d),
          ),
        ),
        debugShowCheckedModeBanner: false,
        builder: Authenticator.builder(),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
