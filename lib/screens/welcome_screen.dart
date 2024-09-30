import 'package:flutter/material.dart';
import 'package:bus_buddy2/screens/signin_screen.dart';
import 'package:bus_buddy2/screens/signup_screen.dart';
import 'package:bus_buddy2/widgets/welcome_button.dart';
import 'package:bus_buddy2/widgets/custom_scaffold.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Align(
              alignment: Alignment.topCenter, // Align towards the top-right
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0), // Add top and right margin
                child: Image.asset(
                  'assets/images/logo_white.png', // Path to your logo image
                  width: MediaQuery.of(context).size.width *
                      0.5, // Adjust width as needed
                  height: MediaQuery.of(context).size.height *
                      0.5, // Adjust height as needed
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Align buttons at the bottom
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: WelcomeButton(
                    buttonText: 'Log in',
                    onTap:
                        SignInScreen(), // Ensure SignInScreen is correctly defined
                    color: Colors.transparent,
                    textColor: Colors.white,
                    borderColor: Colors.white, // White border for "Sign in"
                    textStyle: TextStyle(
                      fontFamily: 'GabrielSans', // Use your custom font
                      fontSize: 18, // Adjust font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5), // Add space between buttons
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: WelcomeButton(
                    buttonText: 'Create an account',
                    onTap:
                        SignUpScreen(), // Ensure SignUpScreen is correctly defined
                    color: Colors.white, // White background
                    textColor: Color.fromARGB(255, 13, 13, 13), // Black text
                    borderColor: Colors.white, // White border
                    textStyle: TextStyle(
                      fontFamily: 'GabrielSans', // Use your custom font
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
