import 'package:events_app/constants/functions.dart';
import 'package:events_app/presentation/screens/forgot_password_screen.dart';
import 'package:events_app/presentation/screens/layout_screen.dart';
import 'package:events_app/presentation/screens/register_screen.dart';
import 'package:events_app/presentation/widgets/navigation_button.dart';
import 'package:events_app/presentation/widgets/custom_text_field.dart';
import 'package:events_app/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                vertical: 100.0,
                horizontal: 20.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/small_logo.png',
                      width: 100.0,
                    ),
                    const SizedBox(height: 30.0),
                    const CustomTextField(
                      label: 'رقم الجوال/البريد الإلكتروني',
                      icon: 'phone',
                    ),
                    const SizedBox(height: 20.0),
                    const CustomTextField(
                      label: 'كلمة المرور',
                      icon: 'lock',
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: const Text(
                            'الدخول كزائر',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          onPressed: () => nextPage(context, const AppLayout()),
                        ),
                        TextButton(
                          child: const Text(
                            'نسيت كلمة المرور؟',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          onPressed: () =>
                              nextPage(context, const ForgotPasswordScreen()),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    SubmitButton(
                      text: 'دخول',
                      onPressed: () => nextPage(context, const AppLayout()),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -2.0,
              right: -2.0,
              child: NavigationButton(
                onTap: () => nextPage(context, const RegisterScreen()),
                text: 'تسجيل',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
