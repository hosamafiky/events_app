import 'package:events_app/constants/functions.dart';
import 'package:events_app/presentation/screens/layout_screen.dart';
import 'package:events_app/presentation/widgets/custom_text_field.dart';
import 'package:events_app/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class ActivationCodeScreen extends StatelessWidget {
  const ActivationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/background.png',
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/small_logo.png',
                        width: 100.0,
                      ),
                      const SizedBox(height: 30.0),
                      const CustomTextField(
                        label: 'كود التفعيل',
                        notWhite: true,
                        icon: 'check',
                      ),
                      const SizedBox(height: 20.0),
                      SubmitButton(
                        text: 'تأكيد',
                        onPressed: () => nextPage(context, const AppLayout()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
