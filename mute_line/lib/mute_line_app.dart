import 'package:flutter/material.dart';
import 'package:mute_line/features/auth/presentation/screens/mute_line_signin_screen.dart';
import 'package:mute_line/features/auth/presentation/screens/mute_line_signup_screen.dart';
import 'package:mute_line/features/welcome/presentation/screens/mute_line_welcome_screen.dart';

class MuteLineApp extends StatelessWidget {
  const MuteLineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MuteLine Messenger',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/signin": (context) => const MuteLineSigninScreen(),
        "/signup": (context) => const MuteLineSignupScreen(),
      },
      home: const MuteLineWelcomeScreen(),
    );
  }
}
