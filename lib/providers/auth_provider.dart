import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pccoe_hackathon/screens/auth/email_verification_screen.dart';
import 'package:pccoe_hackathon/screens/home/home_screen.dart';

class AuthProvider with ChangeNotifier {
  String? _userId;
  String? _emailValue;
  String? _token;
  bool? _isVerified;

  bool? get verifiedStatus => _isVerified;
  String? get token => _token;
  String? get emailValue => _emailValue;
  String? get userId => _userId;

  setEmailValue(String value) {
    _emailValue = value;
    notifyListeners();
  }

  // API endpoint URLss
  static const String _baseUrl = 'http://localhost:8000';
  static const String _signInUrl = '$_baseUrl/auth/sign-in/';
  static const String _signUpUrl = '$_baseUrl/auth/sign-up/';
  static const String _verifyOtpUrl = '$_baseUrl/auth/verify/';

  // Method to sign in
  Future<void> signIn(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(_signInUrl),
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: {
            "Content-Type": "application/json",
          });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _userId = data['token'];
        notifyListeners();
      } else {
        // Handle errors based on response status code
        throw Exception('Failed to sign in: ${response.statusCode}');
      }
    } catch (e) {
      print('Error signing in: $e');
      throw Exception('Failed to sign in');
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      final _signUpUrl =
          "http://localhost:8000/auth/sign-up/"; // Replace with your actual sign-up URL

      final response = await http.post(
        Uri.parse(_signUpUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _userId =
            responseData['userId']; // Assuming userId is part of the response
        notifyListeners();
        // Perform further actions as needed with _userId
        print('User signed up successfully with userId: $_userId');
      } else {
        throw Exception('Failed to sign up: ${response.statusCode}');
      }
    } catch (e) {
      print('Error signing up: $e');
      throw Exception('Failed to sign up');
    }
  }

  // Method to verify OTP
  Future<void> verifyOTP(String otp, String email) async {
    try {
      final response = await http.post(Uri.parse(_verifyOtpUrl),
          body: jsonEncode({
            "email": email,
            "otp": otp,
          }),
          headers: {
            "Content-Type": "application/json",
          });

      if (response.statusCode == 200) {
        // OTP verification successful
        // You may handle additional logic here, such as updating user authentication status
        final responseData = json.decode(response.body);
        if (responseData['code'] == otp) {
          _isVerified = true;
          notifyListeners();
        }
      } else {
        // Handle errors based on response status code
        throw Exception('Failed to verify OTP: ${response.statusCode}');
      }
    } catch (e) {
      print('Error verifying OTP: $e');
      throw Exception('Failed to verify OTP');
    }
  }
}
