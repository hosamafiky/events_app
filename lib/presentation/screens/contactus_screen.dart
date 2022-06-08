import 'package:events_app/constants/palette.dart';
import 'package:events_app/constants/strings.dart';
import 'package:events_app/constants/style.dart';
import 'package:events_app/presentation/screens/sheets/suggestion_sheet.dart';
import 'package:events_app/presentation/widgets/custom_bottom_sheet.dart';
import 'package:events_app/presentation/widgets/info_text_field.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    addressController.text = 'محلة دمنة - المنصورة';
    phoneController.text = '01021895413';
    emailController.text = 'hussamafiky@gmail.com';
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            'اتصل بنا',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/bg_color_vectors.png',
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                const SizedBox(height: 40.0),
                Container(
                  padding: const EdgeInsets.all(50.0),
                  child: const Text(
                    Strings.onboardPageText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              children: [
                                InfoTextField(
                                  text: 'العنوان',
                                  controller: addressController,
                                ),
                                const SizedBox(height: 20.0),
                                InfoTextField(
                                  text: 'رقم الجوال',
                                  controller: phoneController,
                                ),
                                const SizedBox(height: 20.0),
                                InfoTextField(
                                  text: 'البريد الإلكتروني',
                                  controller: emailController,
                                ),
                                const SizedBox(height: 20.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        'assets/images/insta.png',
                                        width: 50.0,
                                      ),
                                      Image.asset(
                                        'assets/images/twitter.png',
                                        width: 50.0,
                                      ),
                                      Image.asset(
                                        'assets/images/facebook.png',
                                        width: 50.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () => showModalCustomBottomSheet(
                              context: context,
                              enableDrag: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: borderRadius,
                              ),
                              builder: (context) => const SuggestionSheet(),
                            ),
                            child: const Text(
                              'إرسال شكوى أو اقتراح',
                              style: TextStyle(
                                color: Palette.kSecondaryColor,
                              ),
                            ),
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
      ),
    );
  }
}
