import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recette_flutter/screens/auth/signup.dart';
import 'package:recette_flutter/screens/home.dart';

import '../../controllers/auth.dart';
import '../../models/user_model.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:recette_flutter/controllers/user_provider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  
  void authenticate(BuildContext context) async {
  var authUrl = "http://127.0.0.1:8000/api/user/sign-in";

  var requestBody = {
    'email': usernameController.text,
    'password': passwordController.text,
  };

  var response = await http.post(Uri.parse(authUrl), body: requestBody);

  if (response.statusCode == 200) {
    var responseData = convert.jsonDecode(response.body);

    var user = User(
      username: responseData['data']['user']['username'],
      email: responseData['data']['user']['email'],
    );

    // ignore: use_build_context_synchronously
    Provider.of<UserProvider>(context, listen: false).setUser(user);

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Home()),
    );
  } else {
    // Handle authentication failure
  }
}

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
                'Welcome back. We missed you!',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
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

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap: () => authenticate(context),
                buttonText: "Sign In",
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                      onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignUp())),
                      child: const Text(
                        'Register now',
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
