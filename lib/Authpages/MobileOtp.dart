// ignore_for_file: override_on_non_overriding_member
import 'dart:async';

import 'package:firebaseproject/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebaseproject/Splashscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileOtpForm extends StatefulWidget {
  // ignore: use_super_parameters
  const MobileOtpForm ({Key? key}) : super(key: key);

  @override
  State<MobileOtpForm > createState() => _MobileOtpFormState();
}

class _MobileOtpFormState extends State<MobileOtpForm> {
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
          BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SplashScreen()));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Verification code",
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "we have sent you the verification code",
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black45,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            for (int i = 0; i < 4;i++)
              SizedBox(
                height: 68,
                width: 64,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  onSaved: (pin1) {},
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
          Row(
            children: [
              const Text(
                "+91******8999",
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
                          builder: (context) => const SplashScreen()));
                },
                child: Text(
                  "Change Phone number ?",
                  style: GoogleFonts.sofiaSans(
                    textStyle: const TextStyle(color: Colors.indigo,fontSize: 16),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 40,
          child:
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Time Left: $secondsRemaining seconds'),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                style: ElevatedButton.styleFrom(
                  primary: secondsRemaining > 0?Colors.black87:Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text("Verify", style: GoogleFonts.roboto(fontSize: 20)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                  "Resend code",
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
