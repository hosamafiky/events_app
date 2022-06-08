import 'package:events_app/constants/palette.dart';
import 'package:events_app/constants/strings.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            width: 350.0,
            height: 350.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 50.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Palette.kPrimaryColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(70.0),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Palette.kSecondaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: const Text(
                      Strings.onboardPageText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
