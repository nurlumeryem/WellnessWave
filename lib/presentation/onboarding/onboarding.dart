import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/homePage/home_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/onboarding.png',
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreen()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Let us help you',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).focusColor,
                      minimumSize: const Size(double.infinity, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
