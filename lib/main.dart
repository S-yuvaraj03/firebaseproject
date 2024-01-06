import 'package:firebaseproject/Splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frontend',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
      },
    );
  }
}

const CtextField = InputDecoration(
  hintText: 'hintText',
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(),
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    )
  )
);

class CButton extends StatelessWidget {
  
  CButton({@required this.colour, @required this.onPress, @required this.text});
  final colour;
  final onPress;
  final text;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    queryData.devicePixelRatio;
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return Material(
      color: colour,
      borderRadius: BorderRadius.circular(10),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: onPress,
        minWidth: double.infinity,
        height: screenHeight*0.06,
        child: Text(
          text,
          style: kOnpressTextStyle,
        ),
      ),
    );
  }
}

const kOnpressTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.0,
);
