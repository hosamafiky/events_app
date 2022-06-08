import 'package:events_app/presentation/widgets/cancel_button.dart';
import 'package:events_app/presentation/widgets/confirm_button.dart';
import 'package:events_app/presentation/widgets/info_text_field.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text = 'حسام عابد الفقي';
    phoneController.text = '01021895413';
    emailController.text = 'hosamafiky@gmail.com';
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Container(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: Image.asset('assets/images/right.png'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                icon: const ImageIcon(
                  AssetImage('assets/images/add_photo.png'),
                  size: 25.0,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              color: Colors.black,
              child: Image.asset(
                'assets/images/profile_pic.png',
                fit: BoxFit.cover,
                color: Colors.white.withOpacity(0.5),
                colorBlendMode: BlendMode.modulate,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            right: 35.0,
                            left: 35.0,
                            top: 60.0,
                            bottom: 0.0,
                          ),
                          child: Column(
                            children: [
                              InfoTextField(
                                text: 'اسم المستخدم',
                                controller: nameController,
                                isEdit: true,
                              ),
                              const SizedBox(height: 15.0),
                              InfoTextField(
                                text: 'رقم الجوال',
                                controller: phoneController,
                                isEdit: true,
                              ),
                              const SizedBox(height: 15.0),
                              InfoTextField(
                                text: 'البريد الإلكتروني',
                                controller: emailController,
                                isEdit: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ConfirmButton(
                                  text: 'تأكيد',
                                  onTap: () {
                                    //Code to go.
                                  },
                                ),
                              ),
                              Expanded(
                                child: CancelButton(
                                  onTap: () => Navigator.pop(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
