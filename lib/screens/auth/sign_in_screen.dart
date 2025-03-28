import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slicing_mobile/screens/onboarding/onboarding_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/social_button.dart';
import 'sign_up_screen.dart';
import '../profile/profile_screen.dart';
import '../../widgets/toggle_button.dart';
// import 'mobile_sign_in_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isSignIn = true;
  bool _isEmail = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFF1B232A),
        child:  SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              _topButton(context),
              const SizedBox(height: 40,),
              _signInText(),
              const SizedBox(height:40,),
              _emailInput(),
              const SizedBox(height: 20,),
              _passwordInput(),
              _forgetPasswordRow(),
              const SizedBox(height: 40,),
              _signInButton(context),
              const SizedBox(height: 20,),
              _loginButton(),
              const SizedBox(height: 20,),
              _socialLogin(context),
              const SizedBox(height: 40,),
              _fingerText(context),
            ],
          ),
        ),
      ),
      
   
    );
  }




























  Center _fingerText(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(
            icon: const Icon(
              Icons.fingerprint,
              size: 50,
              color: Color(0xFF5ED5A8),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          const SizedBox(height: 10),
          const Text(
            'Use fingerprint instead?',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Row _socialLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SocialButton(
            icon: FontAwesomeIcons.facebook,
            text: 'Facebook',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            iconColor: Colors.blue,
            backgroundColor: Colors.white,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: SocialButton(
            icon: FontAwesomeIcons.google,
            text: 'Google',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            iconColor: Colors.red,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Center _loginButton() {
    return const Center(
      child: Text(
        'Or login with',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }

  CustomButton _signInButton(BuildContext context) {
    return CustomButton(
      text: 'Sign In',
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      },
      color: const Color(0xFF5ED5A8),
    );
  }

  Row _forgetPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: Color(0xFF5ED5A8),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _isEmail = !_isEmail;
            });
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Text(
            _isEmail ? 'Sign in with mobile' : 'Sign in with email',
            style: const TextStyle(
              color: Color(0xFF5ED5A8),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  CustomTextField _passwordInput() {
    return const CustomTextField(
      label: 'Password',
      isPassword: true,
      placeholder: 'Enter your password',
    );
  }

  CustomTextField _emailInput() {
    return CustomTextField(
      label: _isEmail ? 'Email' : 'Mobile Number',
      placeholder: _isEmail ? 'Enter your email' : 'Enter your mobile number',
    );
  }

  Text _signInText() {
    return const Text(
      'Sign in',
      style: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Container _topButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xFF161C22),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: ToggleButton(
              text: 'Sign In',
              isSelected: _isSignIn,
              onPressed: () => setState(() => _isSignIn = true),
            ),
          ),
          Expanded(
            child: ToggleButton(
              text: 'Sign Up',
              isSelected: !_isSignIn,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const SignUpScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
