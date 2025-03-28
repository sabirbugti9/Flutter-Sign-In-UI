import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_button.dart';
import '../auth/sign_in_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2C4946), Color(0xFF1B232A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: AppConstants.onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final data = AppConstants.onboardingData[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    data['image']!,
                    height: 300,
                  ),
                    const SizedBox(height: 40),
                    Text(
                    data['title']!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      data['description']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    ),
                  ],
              );
            },
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: AppConstants.onboardingData.length,
                effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xFF777777),
                    dotColor: Color(0xFF252E35),
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: CustomButton(
              color: const Color(0xFF5ED5A8),
              text: 'Next',
              onPressed: () {
              if (_currentPage < AppConstants.onboardingData.length - 1) {
                _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                );
              } else {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              }
              },
            ),
          ),
        ],
      ),
    );
  }
}