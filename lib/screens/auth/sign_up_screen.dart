import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pccoe_hackathon/providers/auth_provider.dart';
import 'package:pccoe_hackathon/screens/auth/email_verification_screen.dart';
import 'package:pccoe_hackathon/screens/auth/sign_in_screen.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();

  static const routeName = '/sign-up';
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/sign_in.png"),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Sign up",
              style:
                  GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your email Id",
                    style: GoogleFonts.roboto(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter the password",
                    style: GoogleFonts.roboto(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              radius: 10,
              onTap: () async {
                await authProvider.signUp(_email.text, _password.text);
                if (authProvider.userId != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('User registered successfully')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text('An error occured while registering user!')));
                }
                Navigator.of(context).pushReplacementNamed(
                    EmailVerificationScreen.routeName,
                    arguments: authProvider.userId);

                // authProvider.signUp(_email.text, _password.text, context);
                // if (authProvider.userId != null) {
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(
                    255,
                    13,
                    132,
                    201,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Already have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SigninScreen.routeName);
                    },
                    child: Text(
                      "Sign in",
                      style: GoogleFonts.roboto(
                        color: Color.fromARGB(255, 13, 132, 201),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
