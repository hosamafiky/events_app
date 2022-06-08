import 'package:events_app/presentation/widgets/info_text_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text = 'حسام عابد الفقي';
    phoneController.text = '01021895413';
    emailController.text = 'hosamafiky@gmail.com';
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/profile_pic.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 300.0),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(80.0),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35.0,
                      vertical: 60.0,
                    ),
                    child: Column(
                      children: [
                        InfoTextField(
                          text: 'اسم المستخدم',
                          controller: nameController,
                        ),
                        const SizedBox(height: 15.0),
                        InfoTextField(
                          text: 'رقم الجوال',
                          controller: phoneController,
                        ),
                        const SizedBox(height: 15.0),
                        InfoTextField(
                          text: 'البريد الإلكتروني',
                          controller: emailController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
