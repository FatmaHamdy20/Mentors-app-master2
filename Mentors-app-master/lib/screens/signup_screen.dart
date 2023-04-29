import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SignupScreen extends StatefulWidget {
  static const String screenRoute ='signupscreen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(), password: _passwordController.text.trim());
          Navigator.of(context).pushNamed('/');
    }
  }
    bool passwordConfirmed(){
      if(_confirmPasswordController.text.trim() == _passwordController.text.trim()){
        return true;
      } else {
        return false;
      }
    }

  void openSigninScreen(){
    Navigator.of(context).pushReplacementNamed('loginScreen');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //image
                Image.asset('images/WhatsApp Image 2023-03-29 at 5.23.38 PM.jpeg'),
                SizedBox(height: 10,),
                //title
                Text(
                  'Sign Up',
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 40,fontWeight: FontWeight.bold
                  ),
                ),
                //subtitle
                Text(
                    'Here you can make your account',
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 18
                    )
                ),
                SizedBox(height: 5,),

                // email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(

                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(

                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                //confirm password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(

                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(

                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text('Sign Up',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                      ),
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 12,),
                // text : sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('already a member? ',
                        style: GoogleFonts.robotoCondensed(
                          fontWeight: FontWeight.bold,)),
                    GestureDetector(
                      onTap: openSigninScreen,
                      child: Text('Log in here',
                        style: GoogleFonts.robotoCondensed(color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
