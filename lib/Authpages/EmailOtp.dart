// ignore_for_file: override_on_non_overriding_member
import 'dart:async';
import 'package:firebaseproject/sample.dart';
// ignore: unused_import
import 'package:firebaseproject/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'dart:math';

class EmailOtpForm extends StatefulWidget {
  const EmailOtpForm({super.key});

  @override
  State<EmailOtpForm> createState() => _EmailOtpFormState();
}

class _EmailOtpFormState extends State<EmailOtpForm> {
  final Pinkey = GlobalKey<FormState>();

  @override
  // ignore: unused_field
  Timer? _timer;
  int secondsRemaining = 300;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          // Time is up, navigate back to the first page
          print("failed");
        }
      });
    });
  }

  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    queryData.devicePixelRatio;
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return Form(
      key: Pinkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackButton(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Verification code",
              style: GoogleFonts.poppins(
                fontSize: screenWidth*0.06,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "we have sent you the verification code through email, it only valid for 5 mins",
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: screenWidth*0.037,
                fontWeight: FontWeight.w400,
                color: Colors.black45,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            for (int i = 0; i < 6; i++)
              SizedBox(
                height: screenHeight*0.07,
                width: screenWidth*0.12,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  onSaved: (value) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Colors.black87)),
                    hintText: "0",
                  ),
                  style: Theme.of(context).textTheme.titleLarge,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
          ]),
          SizedBox(
            height: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Time Left : $secondsRemaining seconds'),
              ),
            ),
          ),
          CButton(colour: secondsRemaining > 0 ? Colors.black : Colors.red,
            onPress: () {
                if (secondsRemaining > 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstPage()));
                } else {
                  Null;
                }
              },
              // Disable button if isButtonEnabled is false,
            text: "Verify code",
          ),
          Row(
            children: [
              const Text(
                "if you not recieved email, click",
                style: TextStyle(fontSize: 13),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 13),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstPage()));
                },
                child: const Text(
                  "Resend email",
                  style: TextStyle(color: Colors.indigoAccent, fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// if (codeController.text == generatedCode) {
//       setState(() {
//         verificationStatus = 'Verification successful!';
//       });
//     } else {
//       setState(() {
//         verificationStatus = 'Incorrect code. Please try again.';
//       });
//     }
