import 'package:events_app/constants/functions.dart';
import 'package:events_app/data/services/auth.dart';
import 'package:events_app/presentation/screens/login_screen.dart';
import 'package:events_app/presentation/widgets/custom_text_field.dart';
import 'package:events_app/presentation/widgets/navigation_button.dart';
import 'package:events_app/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();

  final authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/small_logo.png',
                          width: 80.0,
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextField(
                          controller: nameController,
                          label: 'اسم المستخدم',
                          icon: 'user',
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          controller: phoneController,
                          label: 'رقم الجوال',
                          icon: 'phone',
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          controller: emailController,
                          label: 'البريد الإلكتروني',
                          icon: 'email',
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          controller: passwordController,
                          label: 'كلمة المرور',
                          icon: 'lock',
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          controller: confPasswordController,
                          label: 'تأكيد كلمة المرور',
                          icon: 'lock',
                        ),
                        const SizedBox(height: 20.0),
                        SubmitButton(
                          text: 'تسجيل',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              authServices.register(
                                context,
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                                confPassword: confPasswordController.text,
                              );
                            }
                          },
                        ),
                      ],
                    ),
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
