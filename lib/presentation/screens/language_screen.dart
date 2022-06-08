import 'package:events_app/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/small_logo.png',
              width: 100.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardScreen(),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 100.0),
                      Image.asset(
                        'assets/images/arabic_language.png',
                        width: 100.0,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          width: 6,
                          color: Colors.white,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'English',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
