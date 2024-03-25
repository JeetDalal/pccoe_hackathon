import 'package:flutter/material.dart';
import 'package:pccoe_hackathon/providers/auth_provider.dart';
import 'package:pccoe_hackathon/providers/model_data_provider.dart';
import 'package:pccoe_hackathon/screens/auth/doctor_signin_screen.dart';
import 'package:pccoe_hackathon/screens/auth/doctor_verification_screen.dart';
import 'package:pccoe_hackathon/screens/auth/email_verification_screen.dart';
import 'package:pccoe_hackathon/screens/auth/sign_in_screen.dart';
import 'package:pccoe_hackathon/screens/auth/sign_up_screen.dart';
import 'package:pccoe_hackathon/screens/carousel/causcreen.dart';
import 'package:pccoe_hackathon/screens/home/home_screen.dart';
import 'package:pccoe_hackathon/screens/looks_good.dart';
import 'package:pccoe_hackathon/screens/reports.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TFLiteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        title: 'down syndrome detection',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Causcreen(),
        routes: {
          SigninScreen.routeName: (context) => const SigninScreen(),
          SignupScreen.routeName: (context) => const SignupScreen(),
          EmailVerificationScreen.routeName: (context) =>
              const EmailVerificationScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          DoctorSigninScreen.routeName: (context) => DoctorSigninScreen(),
          DoctorVerificationScreen.routeName: (context) =>
              DoctorVerificationScreen(),
          LooksGood.routeName: (context) => LooksGood(),
          DownSyndromeReport.routeName: (context) => DownSyndromeReport()
        },
      ),
    );
  }
}
