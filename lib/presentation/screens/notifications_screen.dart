import 'package:events_app/constants/palette.dart';
import 'package:events_app/data/data.dart';
import 'package:events_app/presentation/widgets/dismissible_widget.dart';
import 'package:events_app/presentation/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Palette.kPrimaryColor),
          centerTitle: true,
          title: const Text(
            'الإشعارات',
            style: TextStyle(color: Palette.kPrimaryColor),
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  notifications.isEmpty
                      ? const Text('لا توجد إشعارات جديدة')
                      : Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var notification = notifications[index];
                              return DismissibleWidget(
                                notification: notification,
                                child: NotificationWidget(
                                  notification: notifications[index],
                                  index: index,
                                ),
                                onDismissed: (direction) {
                                  setState(() {
                                    notifications.removeAt(index);
                                  });
                                },
                              );
                            },
                            separatorBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(height: 2.0),
                            ),
                            itemCount: notifications.length,
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
