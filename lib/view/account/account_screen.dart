import 'package:flutter/material.dart';
import 'package:grocery_app/view/account/auth/sign_in_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 36,
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/user_image.png'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    'Sign in your account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          buildAccountCard(
              title: 'Profile Info',
              onClick: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()));
              }),
          buildAccountCard(title: 'Notification', onClick: () {}),
          buildAccountCard(title: 'Setting', onClick: () {}),
          buildAccountCard(title: 'About Us', onClick: () {}),
          buildAccountCard(title: 'Terms of Service', onClick: () {}),
          buildAccountCard(title: 'Sign In', onClick: () {}),
        ],
      ),
    );
  }

  Padding buildAccountCard(
      {required String title, required Function() onClick}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 0.1,
                  blurRadius: 7,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const Icon(Icons.keyboard_arrow_right_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
