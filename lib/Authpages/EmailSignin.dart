// ignore: file_names
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import '../Splashscreen.dart';
import 'EmailOtp.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({Key? key}) : super(key: key);

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  // final TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  final emailControler = TextEditingController();

  Color btnbackgroundColor = Colors.grey.shade300;

  Color btnTextColor = Colors.black26;

  Color emailBorderColor = Colors.grey.shade300;

  bool btnVisible = false;

  bool isButtonEnabled = true;

  var _enteredEmail = '';

  get http => null;

  Future<void> signup() async {
    final response = await http.post(
      Uri.parse('YOUR_FASTAPI_BACKEND_URL/signup'),
      body: {
        'email': emailControler.text,
      },
    );

    if (response.statusCode == 201) {
      // Show success message or navigate to login page
    } else {
      // Show error message
    }
  }

  void _submit() {
    final isValid = formkey.currentState!.validate();

    if (isValid) {
      formkey.currentState!.save();
      print(_enteredEmail + " entered email");
    }
  }

  @override
  Widget build(BuildContext context) {
    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      return value!.isEmpty || !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
      }

    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SplashScreen()));
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Enter Email",
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
            "Fill your email address below",
            textAlign: TextAlign.right,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black45,
            ),
          ),
        ),
        Form(
          key: formkey,
          // width: double.infinity,
          child: TextFormField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("[0-9@a-zA-Z.]")),
              ],
              controller: emailControler,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: AutofillHints.email,
                  suffixIcon: Icon(
                    CupertinoIcons.at_circle_fill,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.red),
                  )),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              // autofillHints: Characters(""),
              textCapitalization: TextCapitalization.none,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.done,
              validator: validateEmail,
              onChanged: (value) {
                setState(() {
                  if (validateEmail(value) == null) {
                    emailBorderColor = Colors.red;
                  } else {
                    emailBorderColor = Colors.black87;
                    print(value + "success");
                  }
                });
              },
              onSaved: (value) {
                _enteredEmail = value!;
              }),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            _submit();
            final isValidate = formkey.currentState!.validate();
            if (isValidate) {
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
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                    ),
                    child: const Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        children: [EmailOtpForm()],
                      ),
                      resizeToAvoidBottomInset: false,
                    ),
                  ),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Text(
            "Send Email",
            style: GoogleFonts.roboto(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    ));
  }
  // Future<void> _saveText() async {
  //   final textToSave = _textEditingController.text;
  //   final file = await _getLocalFile();

  //   await file.writeAsString(textToSave);
  //   _loadSavedText();
  // }
}
