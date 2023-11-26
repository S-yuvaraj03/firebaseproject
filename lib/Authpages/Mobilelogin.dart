// ignore_for_file: avoid_print

import 'package:firebaseproject/Authpages/EmailSignin.dart';
import 'package:firebaseproject/Authpages/MobileOTP.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Welcome Back",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Fill out the information below in order to access your account",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SvgPicture.asset("assets/svg/businessman_icon.svg", height: 140),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InternationalPhoneNumberInput(
              textStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              onInputChanged: (number) {
                print(number.phoneNumber);
              },
              spaceBetweenSelectorAndTextField: BorderSide.strokeAlignOutside,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              showGeneralDialog(
                barrierDismissible: true,
                barrierLabel: "OTP Verification",
                context: context,
                pageBuilder: (context, _, __) => Center(
                  child: Container(
                    height: 620,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.90),
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                    ),
                    child: const Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: MobileOtpForm(),
                          ),
                        ],
                      ),
                      resizeToAvoidBottomInset: false,
                    ),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                )),
            icon: const Icon(CupertinoIcons.arrow_right),
            label: const Text(
              "Continue",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          const Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "or",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Expanded(child: Divider()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/svg/google_logo_icon.svg",
                  height: 54,
                  width: 54,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: SvgPicture.asset("assets/svg/fb2_icon.svg",
                    height: 54, width: 54),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                  showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: "Email Signin",
                    context: context,
                    pageBuilder: (context, _, __) => Center(
                      child: Container(
                        height: 620,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(
                            vertical: 32, horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.90),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                        ),
                        child: const Scaffold(
                          backgroundColor: Colors.transparent,
                          body: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: EmailForm(),
                              ),
                            ],
                          ),
                          resizeToAvoidBottomInset: false,
                        ),
                      ),
                    ),
                  );
                },
                icon: SvgPicture.asset("assets/svg/email_icon.svg",
                    height: 54, width: 54),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "by clicking continue you are accepting our terms & condition",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
