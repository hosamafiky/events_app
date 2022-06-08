import 'package:events_app/constants/palette.dart';
import 'package:events_app/presentation/screens/about_app_screen.dart';
import 'package:events_app/presentation/screens/contactus_screen.dart';
import 'package:events_app/presentation/screens/layout_screen.dart';
import 'package:events_app/presentation/screens/login_screen.dart';
import 'package:events_app/presentation/screens/settings_screen.dart';
import 'package:events_app/presentation/screens/terms_screen.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Palette.kPrimaryColor,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    'assets/images/bg_image.png',
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.00,
                      height: 80.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/profile_pic.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'حسام عابد الفقي',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            listTileWidget(
              title: 'الرئيسية',
              icon: 'white_home',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AppLayout(),
                  ),
                );
              },
            ),
            listTileWidget(
              title: 'الهيئات',
              icon: 'terms',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AppLayout(),
                  ),
                );
              },
            ),
            listTileWidget(
              title: 'حول التطبيق',
              icon: 'about_app',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AboutAppScreen(),
                  ),
                );
              },
            ),
            listTileWidget(
              title: 'مشاركة التطبيق',
              icon: 'share_app',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AppLayout(),
                  ),
                );
              },
            ),
            listTileWidget(
              title: 'أحكام وشروط',
              icon: 'terms',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TermsScreen(),
                  ),
                );
              },
            ),
            listTileWidget(
              title: 'اتصل بنا',
              icon: 'contact_us',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreen(),
                  ),
                );
              },
            ),
            listTileWidget(
              title: 'إعدادات',
              icon: 'setting',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
            listTileWidget(
              title: 'تسجيل الخروج',
              icon: 'logout',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile listTileWidget({
    required String title,
    required String icon,
    required Function() onTap,
  }) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 3),
      leading: ImageIcon(
        AssetImage('assets/images/$icon.png'),
        color: Colors.white.withOpacity(0.5),
        size: 25.0,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white.withOpacity(.5),
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
