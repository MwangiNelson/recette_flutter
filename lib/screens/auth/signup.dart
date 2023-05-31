import 'package:flutter/material.dart';
import 'package:recette_flutter/screens/auth/login.dart';

import '../../controllers/auth.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 189, 0, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              Image.asset("assets/images/recette_logo.png"),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              const Text(
                'Create your own account for free.',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 10),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: userEmailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
// password textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(height: 25),

              // sign in button
              const MyButton(
                onTap: userSignUp,
                buttonText: "Sign Up",
              ),


              const SizedBox(height: 50),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                      onTap: () => Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Login())),
                      child: const Text(
                        'Sign in here.',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
