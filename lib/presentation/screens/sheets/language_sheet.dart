import 'package:events_app/constants/palette.dart';
import 'package:events_app/presentation/widgets/cancel_button.dart';
import 'package:events_app/presentation/widgets/confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class LanguageSheet extends StatefulWidget {
  const LanguageSheet({Key? key}) : super(key: key);

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  bool isArabic = true;

  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: [
                    const Text(
                      'اختر لغة التطبيق',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      children: [
                        InkWell(
                          onTap: () => setState(() {
                            isArabic = true;
                            isEnglish = false;
                          }),
                          child: Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: isArabic
                                  ? GradientBoxBorder(
                                      width: 2.0,
                                      gradient: Palette.fieldGradient,
                                    )
                                  : Border.all(
                                      width: 2.0,
                                      color: Colors.grey[300]!,
                                    ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'العربية',
                                  style: TextStyle(
                                    color: isArabic
                                        ? Colors.grey[700]
                                        : Colors.grey[500],
                                    fontSize: 16.0,
                                  ),
                                ),
                                if (isArabic)
                                  Image.asset('assets/images/success.png'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        InkWell(
                          onTap: () => setState(() {
                            isArabic = false;
                            isEnglish = true;
                          }),
                          child: Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: isEnglish
                                  ? GradientBoxBorder(
                                      width: 2.0,
                                      gradient: Palette.fieldGradient,
                                    )
                                  : Border.all(
                                      width: 2.0,
                                      color: Colors.grey[300]!,
                                    ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'الإنجليزية',
                                  style: TextStyle(
                                    color: isEnglish
                                        ? Colors.grey[700]
                                        : Colors.grey[500],
                                    fontSize: 16.0,
                                  ),
                                ),
                                if (isEnglish)
                                  Image.asset('assets/images/success.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  ConfirmButton(
                    width: MediaQuery.of(context).size.width * 0.5,
                    text: 'تأكيد',
                    onTap: () {
                      //Code to go.
                    },
                  ),
                  Expanded(
                    child: CancelButton(onTap: () => Navigator.pop(context)),
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
