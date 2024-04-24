import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rove/components/my_button.dart';
import 'package:rove/components/my_textfield.dart';

class WelcomeScreen1 extends StatelessWidget {
  WelcomeScreen1({super.key});

  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signInUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //wrong email
        //wrongEmailPopup();
        print('No user found');
      } else if (e.code == 'wrong-password') {
        //wrong password
        //wrongPasswordPopup();
        print('wrong password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //username textfield
          MyTextField(
              controller: emailController,
              hintText: 'Username',
              obscureText: false),
          SizedBox(
            height: 15,
          ),
          MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true),
          SizedBox(
            height: 15,
          ),
          MyButton(
              onTap: signInUser,
              myButtonColor: Colors.black,
              myButtonText: 'Sign In'),
        ],
      ),
    );
  }
}
