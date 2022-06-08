import 'package:events_app/constants/strings.dart';
import 'package:events_app/presentation/screens/sheets/change_password_sheet.dart';
import 'package:events_app/presentation/screens/sheets/language_sheet.dart';
import 'package:events_app/presentation/widgets/toggle_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationsDisabled = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            'الإعدادات',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50.0),
                                ),
                              ),
                              builder: (context) => const LanguageSheet(),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                minLeadingWidth: 20.0,
                                leading: Image.asset(
                                  'assets/images/pink_shape.png',
                                  width: 20.0,
                                ),
                                title: const Text(
                                  'اللغة',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 1.0,
                          ),
                          InkWell(
                            onTap: () => showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50.0),
                                ),
                              ),
                              builder: (context) => const ChangePassword(),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                minLeadingWidth: 20.0,
                                leading: Image.asset(
                                  'assets/images/pink_shape.png',
                                  width: 20.0,
                                ),
                                title: const Text(
                                  'تغيير كلمة المرور',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 1.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              minLeadingWidth: 20.0,
                              leading: Image.asset(
                                'assets/images/pink_shape.png',
                                width: 20.0,
                              ),
                              title: const Text(
                                'غلق الإشعارات',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                              trailing: ToggleButton(
                                width: 50.0,
                                value: isNotificationsDisabled,
                                onTap: () {
                                  setState(() {
                                    isNotificationsDisabled =
                                        !isNotificationsDisabled;
                                  });
                                },
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 1.0,
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
