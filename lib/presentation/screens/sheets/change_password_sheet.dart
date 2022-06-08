import 'package:events_app/presentation/widgets/cancel_button.dart';
import 'package:events_app/presentation/widgets/confirm_button.dart';
import 'package:events_app/presentation/widgets/info_text_field.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final currentPassController = TextEditingController();

  final newPassController = TextEditingController();

  final newPassCommitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    InfoTextField(
                      text: 'كلمة المرور الحالية',
                      controller: currentPassController,
                      isEdit: true,
                      floating: false,
                      isPassword: true,
                    ),
                    const SizedBox(height: 15.0),
                    InfoTextField(
                      text: 'كلمة المرور الجديدة',
                      controller: newPassController,
                      isEdit: true,
                      floating: false,
                      isPassword: true,
                    ),
                    const SizedBox(height: 15.0),
                    InfoTextField(
                      text: 'تأكيد كلمة المرور الجديدة',
                      controller: newPassCommitController,
                      isEdit: true,
                      floating: false,
                      isPassword: true,
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
