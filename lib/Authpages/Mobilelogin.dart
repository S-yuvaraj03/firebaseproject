// ignore_for_file: avoid_print
import 'package:firebaseproject/Authpages/EmailSignin.dart';
import 'package:firebaseproject/Authpages/MobileOTP.dart';
import 'package:firebaseproject/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    queryData.devicePixelRatio;
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Welcome Back",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth*0.06,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Fill out the information below in order to access your account",
              style: TextStyle(fontSize: screenWidth*0.035),
              textAlign: TextAlign.center,
            ),
          ),
          SvgPicture.asset("assets/svg/businessman_icon.svg", height: screenHeight*0.14),
          Padding(
            padding: const EdgeInsets.all(0.8),
            child: IntlPhoneField(
              disableLengthCheck: true,
              focusNode: focusNode,
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              languageCode: "en",
              onChanged: (phone) {
                print(phone.completeNumber);
              },
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
            ),
          ),
          SizedBox(height: 10,),
          CButton(colour: Colors.black,
          onPress: () {
            MediaQueryData queryData;
            queryData = MediaQuery.of(context);
            queryData.devicePixelRatio;
            double screenWidth = queryData.size.width;
            double screenHeight = queryData.size.height;
              Navigator.pop(context);
              showGeneralDialog(
                barrierDismissible: true,
                barrierLabel: "OTP Verification",
                context: context,
                pageBuilder: (context, _, __) => Center(
                  child: Container(
                    height: screenHeight*0.65,
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
          text: "Continue"),
          Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "or",
                  style: TextStyle(color: Colors.black, fontSize: screenWidth*0.04),
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
                  height: 40,
                  width: 40,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: SvgPicture.asset("assets/svg/fb2_icon.svg",
                    height: 40,
                    width: 40
                  ),
                ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  MediaQueryData queryData;
                  queryData = MediaQuery.of(context);
                  queryData.devicePixelRatio;
                  double screenWidth = queryData.size.width;
                  double screenHeight = queryData.size.height;
                  Navigator.pop(context);
                  showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: "Email Signin",
                    context: context,
                    pageBuilder: (context, _, __) => Center(
                      child: Container(
                        height: screenHeight*0.65,
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
                    height: 40, width: 40),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: 
            Text(
                "by clicking continue you are accepting our terms & condition",
                    style: TextStyle(fontSize: screenWidth*0.037),
                    textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
