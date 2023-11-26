// ignore_for_file: override_on_non_overriding_member

import 'dart:async';
import 'package:firebaseproject/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackButton(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Verification code",
              style: GoogleFonts.poppins(
                fontSize: 20,
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
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black45,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            for (int i = 0; i < 6; i++)
              SizedBox(
                key:Pinkey,
                height: 60,
                width: 50,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  onSaved: (value) {
                    
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.black87)),
                      hintText: "0"),
                  style: Theme.of(context).textTheme.headlineMedium,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ]
          ),
          SizedBox(
            height: 50,
            child:
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Time Left : $secondsRemaining seconds'),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (secondsRemaining > 0) {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirstPage()));
              } else {
                Null;
              }
            },
            // Disable button if isButtonEnabled is false
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                primary: secondsRemaining>0 ? Colors.black:Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            child: Text(
              "Verify code",
              style: GoogleFonts.roboto(fontSize: 20),
            ),
          ),
          Row(
            children: [
              const Text(
                "if you not recieved email, click",
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 13),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirstPage()));
                },
                child: const Text(
                  "Resend email",
                  style: TextStyle(color: Colors.indigoAccent, fontSize: 16),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}


// if (codeController.text == generatedCode) {
    //   setState(() {
    //     verificationStatus = 'Verification successful!';
    //   });
    // } else {
    //   setState(() {
    //     verificationStatus = 'Incorrect code. Please try again.';
    //   });
    // }
