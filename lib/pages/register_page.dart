import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/components/my_button.dart';
import 'package:minimal_social_media_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  // register method
  void registerUser() {
    // show loading circle

    // make sure passwords match

    // try creating the user

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                height: 25,
              ),

              // app name
              Text(
                "M I N I M A L",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),

              // username textfield
              MyTextField(
                  hintText: "Username",
                  obscureText: false,
                  controller: usernameController),
              const SizedBox(
                height: 10,
              ),

              // email textfield
              MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController),
              const SizedBox(
                height: 10,
              ),

              // password textfield
              MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController),
              const SizedBox(
                height: 10,
              ),

              // password confirm textfield
              MyTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: passwordConfirmController),
              const SizedBox(
                height: 10,
              ),

             

              // registerUser in button
              MyButton(
                text: "Register",
                onTap: registerUser,
              ),
              const SizedBox(
                height: 25,
              ),

              // already have an account sign in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Login here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
