import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/screens/chat_screen.dart';
import 'package:firebase_auth_app/screens/home_screen.dart';
import 'package:firebase_auth_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:  ((context, snapshot){
          if(snapshot.hasData){
          return const ChatScreen();
    } else {
          return const LoginScreen();
    }
    }),
      ),
    );
  }
}

