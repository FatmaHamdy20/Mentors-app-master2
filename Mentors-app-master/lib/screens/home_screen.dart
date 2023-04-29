import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  static const String screenRoute='homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello , You\'re Signed in'),
          Text(user.email!),
          MaterialButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
            color: Colors.blueGrey,
            child: Text('Sign Out'),
          )
        ],
      )),
    );
  }
}
