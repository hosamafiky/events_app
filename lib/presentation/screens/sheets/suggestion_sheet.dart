import 'package:events_app/presentation/widgets/cancel_button.dart';
import 'package:events_app/presentation/widgets/confirm_button.dart';
import 'package:events_app/presentation/widgets/info_text_field.dart';
import 'package:flutter/material.dart';

class SuggestionSheet extends StatefulWidget {
  const SuggestionSheet({Key? key}) : super(key: key);

  @override
  State<SuggestionSheet> createState() => _SuggestionSheetState();
}

class _SuggestionSheetState extends State<SuggestionSheet> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 25.0,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'إرسال شكوى أو اقتراح',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      InfoTextField(
                        text: 'اسم المستخدم',
                        controller: nameController,
                        isEdit: true,
                        floating: false,
                      ),
                      const SizedBox(height: 15.0),
                      InfoTextField(
                        text: 'البريد الإلكتروني',
                        controller: emailController,
                        isEdit: true,
                        floating: false,
                      ),
                      const SizedBox(height: 15.0),
                      InfoTextField(
                        text: 'نص الرسالة',
                        controller: messageController,
                        isEdit: true,
                        floating: false,
                        isLong: true,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ConfirmButton(
                        text: 'تأكيد',
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: CancelButton(
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 5.0,
            left: 100.0,
            right: 100.0,
            child: Container(
              width: 70.0,
              height: 3.0,
              color: const Color(0xFFF31D73),
            ),
          ),
        ],
      ),
    );
  }
}
