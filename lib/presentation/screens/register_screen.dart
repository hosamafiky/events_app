import 'package:events_app/constants/functions.dart';
import 'package:events_app/presentation/screens/login_screen.dart';
import 'package:events_app/presentation/widgets/custom_text_field.dart';
import 'package:events_app/presentation/widgets/navigation_button.dart';
import 'package:events_app/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import 'activation_code_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                        width: 80.0,
                      ),
                      const SizedBox(height: 30.0),
                      const CustomTextField(
                        label: 'اسم المستخدم',
                        icon: 'user',
                      ),
                      const SizedBox(height: 10.0),
                      const CustomTextField(
                        label: 'رقم الجوال',
                        icon: 'phone',
                      ),
                      const SizedBox(height: 10.0),
                      const CustomTextField(
                        label: 'البريد الإلكتروني',
                        icon: 'email',
                      ),
                      const SizedBox(height: 10.0),
                      const CustomTextField(
                        label: 'كلمة المرور',
                        icon: 'lock',
                      ),
                      const SizedBox(height: 10.0),
                      const CustomTextField(
                        label: 'تأكيد كلمة المرور',
                        icon: 'lock',
                      ),
                      const SizedBox(height: 20.0),
                      SubmitButton(
                        text: 'تسجيل',
                        onPressed: () =>
                            nextPage(context, const ActivationCodeScreen()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -2.0,
              right: -2.0,
              child: NavigationButton(
                onTap: () => nextPage(context, const LoginScreen()),
                text: 'دخول',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
