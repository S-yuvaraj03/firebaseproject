// ignore: file_names
import 'dart:ui';
import 'package:firebaseproject/Authpages/Mobilelogin.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLoginScreen();
  }

  void _navigateToLoginScreen() {
    Future.delayed(const Duration(seconds: 3), () {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    queryData.devicePixelRatio;
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
      showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: "Login",
        context: context,
        pageBuilder: (context, _, __) => Center(
          child: Container(
            height: screenHeight*0.65,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.90),
              borderRadius: const BorderRadius.all(Radius.circular(40)),
            ),
            child: const Scaffold(
              backgroundColor: Colors.transparent,
              body: LoginForm(),
              resizeToAvoidBottomInset: false,
            ),
          ),
        ),
      );
      // Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    queryData.devicePixelRatio;
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return Scaffold(
      body: Stack(
      children: [
        const RiveAnimation.asset("assets/RiveAssets/onscreen.riv"),
        Positioned(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
          ),
        )
      ],
    ));
  }
}
