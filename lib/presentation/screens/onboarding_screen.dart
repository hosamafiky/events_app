import 'package:events_app/constants/functions.dart';
import 'package:events_app/data/data.dart';
import 'package:events_app/presentation/screens/login_screen.dart';
import 'package:events_app/presentation/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            reverse: true,
            physics: const ClampingScrollPhysics(),
            controller: pageController,
            children: pages,
          ),
          Positioned(
            bottom: -2.0,
            right: -2.0,
            child: NavigationButton(
              text: 'تخطي',
              onTap: () => nextPage(context, const LoginScreen()),
            ),
          ),
          Positioned(
            bottom: 100.0,
            child: SmoothPageIndicator(
              textDirection: TextDirection.rtl,
              onDotClicked: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              controller: pageController,
              count: pages.length,
            ),
          ),
        ],
      ),
    );
  }
}
