import 'package:flutter/material.dart';
import 'package:grocery_app/view/account/auth/sign_in_screen.dart';

import '../../../component/input_outline_button.dart';
import '../../../component/input_text_button.dart';
import '../../../component/input_text_field.dart';
import '../account_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  'Create Account,',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Sign up to started!',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2),
                ),
                const Spacer(
                  flex: 3,
                ),
                const InputTextField(
                    title: 'Full Name'),
                const SizedBox(
                  height: 10,
                ),
                const InputTextField(
                    title: 'Email'),
                const SizedBox(
                  height: 10,
                ),
                const InputTextField(
                  title: 'Password',
                  obsecureText: true,),
                const SizedBox(
                  height: 10,
                ),
                const InputTextField(
                  title: 'Confirm Password',
                  obsecureText: true,),
                const SizedBox(
                  height: 10,
                ),
                const Spacer(),
                InputTextButton(
                    title: 'Sign Up', onClick: () {}),
                const Spacer(),
                InputOutlineButton(
                    title: 'Back', onClick: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const AccountScreen()));
                }),
                const Spacer(
                  flex: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("I'm already a member,"),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SignInScreen()));
                      },
                      child: const Text(
                        ' Sign In',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
}
