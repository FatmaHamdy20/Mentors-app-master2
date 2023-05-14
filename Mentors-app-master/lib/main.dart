import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/auth.dart';
import 'package:firebase_auth_app/screens/post_screen.dart';
import 'package:firebase_auth_app/screens/login_screen.dart';
import 'package:firebase_auth_app/screens/signup_screen.dart';
import 'package:firebase_auth_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const ChatListScreen(),
      initialRoute: _auth.currentUser != null
          ? ChatScreen.screenRoute
          : HomeScreen.screenRoute,
      routes: {
        // '/':(context) => const Auth(),
        HomeScreen.screenRoute: (context) => const HomeScreen(),
        SignupScreen.screenRoute: (context) => const SignupScreen(),
        LoginScreen.screenRoute: (context) => const LoginScreen(),
        ChatScreen.screenRoute: (context) => const ChatScreen(),
        PostScreen.screenRoute: (context) => const PostScreen(),

        //ChatListScreen.screenRoute: (context) => const ChatListScreen(),
      },
      // home: ChatScreen(),
    );
  }
}

