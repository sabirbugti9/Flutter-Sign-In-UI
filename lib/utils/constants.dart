import 'package:flutter/material.dart';

class AppConstants {
  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.black, Color(0xFF1B5E20)],
  );

  static const onboardingData = [
    {
      'title': 'Trade anytime anywhere',
      'description': 'Our trading platform is versatile, user-friendly, and designed to help you trade with ease.',
      'image': 'assets/images/onboarding1.png',
    },
    {
      'title': 'Save and invest at the same time',
      'description': 'Investing in your favorite companies has never been easier. With our platform, you can save and invest at the same time.',
      'image': 'assets/images/onboarding2.png',
    },
    {
      'title': 'Fast and easy transactions',
      'description': 'Intuitive and optimized for speed, our platform ensures that you can make transactions quickly and easily.',
      'image': 'assets/images/onboarding3.png',
    },
  ];
}