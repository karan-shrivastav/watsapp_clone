import 'package:flutter/material.dart';
import 'package:watsapp_clone/auth/screens/otp_screen.dart';
import 'package:watsapp_clone/auth/screens/user_information_screen.dart';
import 'package:watsapp_clone/common/error.dart';
import 'package:watsapp_clone/screens/mobile_chat_screen.dart';
import 'package:watsapp_clone/screens/mobile_layout_screen.dart';
import 'auth/screens/login_screen.dart';
import 'features/select_contacts/screens/select_contact_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());

    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      print('hellllllloooooooooo000000000000000000000000000');
      print(verificationId);
      return MaterialPageRoute(
          builder: (context) => OTPScreen(verificationId: verificationId));

    case MobileLayoutScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => MobileLayoutScreen());

    case UserInformationScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const UserInformationScreen());

    case SelectedContactsScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const SelectedContactsScreen());

    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      return MaterialPageRoute(
          builder: (context) =>  MobileChatScreen(
            name: name,
            uid: uid
          ));
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErrorScreen(error: "This page doesn't exist"),
              ));
  }
}
