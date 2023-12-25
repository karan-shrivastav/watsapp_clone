import 'package:flutter/material.dart';
import 'package:watsapp_clone/auth/screens/login_screen.dart';
import 'package:watsapp_clone/colors.dart';
import 'package:watsapp_clone/common/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome to Watsapp',
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              'assets/bg.png',
              height: 340,
              width: 340,
              color: tabColor,
            ),
            SizedBox(height: size.height / 9),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Read our privacy Policy.Tap "Agree and continue" to accept the Terms and Service.',
                style: TextStyle(color: greyColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
                width: size.width * 0.75,
                child: CustomButton(
                    text: 'AGREE AND CONTINUE',
                    onPressed: () => navigateToLoginScreen(context))),
          ],
        ),
      ),
    );
  }
}
