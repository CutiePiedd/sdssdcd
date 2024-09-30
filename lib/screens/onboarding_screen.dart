import 'dart:async'; // For Timer
import 'package:flutter/material.dart';
import 'package:bus_buddy2/screens/welcome_screen.dart';
import 'package:bus_buddy2/widgets/custom_scaffold.dart'; // Assuming this contains the shared background

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      // Use the same background as WelcomeScreen
      child: GestureDetector(
        onTapUp: (details) {
          // Get the screen width and calculate the tap position
          final screenWidth = MediaQuery.of(context).size.width;
          final tapPosition = details.globalPosition.dx;

          if (tapPosition > screenWidth / 2) {
            // Tap on the right side - go to the next page
            if (_currentPage < 2) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          } else {
            // Tap on the left side - go to the previous page
            if (_currentPage > 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          }
        },
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                    if (page == 2) {
                      _startAutoNavigation();
                    }
                  });
                },
                children: [
                  _buildPage(
                    text: 'Secure Your Seats Effortlessly And Skip The Lines.',
                    textPosition: Alignment.topLeft, // Top left position
                    textAlign: TextAlign.left, // Left text align
                    fontFamily: 'GabrielSans',
                    fontSize: 33,
                    fontWeight: FontWeight.w800,
                  ),
                  _buildPage(
                    text: 'Enjoy A Smooth, Stress Free Journey.',
                    textPosition: Alignment.centerLeft, // Center left position
                    textAlign: TextAlign.left, // Left text align
                    fontFamily: 'GabrielSans',
                    fontSize: 33,
                    fontWeight: FontWeight.w800,
                  ),
                  _buildPage(
                    text: 'Reserve With Ease, Ride With Peace.',
                    textPosition:
                        Alignment.bottomRight, // Bottom right position
                    textAlign: TextAlign.right, // Right text align
                    fontFamily: 'GabrielSans',
                    fontSize: 33,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => _buildDot(index)),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build onboarding pages with customizable text, alignment, etc.
  Widget _buildPage({
    required String text,
    required Alignment textPosition,
    required TextAlign textAlign, // Add textAlign parameter for text alignment
    required String fontFamily,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return Stack(
      children: [
        Align(
          alignment: textPosition, // Use customized alignment for each page
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                color: Colors.white,
              ),
              textAlign: textAlign, // Apply the text alignment
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to build page indicator dots
  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: _currentPage == index ? 12.0 : 8.0,
      height: _currentPage == index ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  // Navigate to WelcomeScreen after 2 seconds when reaching the last page
  void _startAutoNavigation() {
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }
}
