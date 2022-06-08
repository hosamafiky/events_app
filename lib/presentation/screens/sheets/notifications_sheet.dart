import 'package:events_app/constants/style.dart';
import 'package:events_app/data/data.dart';
import 'package:events_app/presentation/screens/notifications_screen.dart';
import 'package:events_app/presentation/widgets/dismissible_widget.dart';
import 'package:events_app/presentation/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationsSheet extends StatefulWidget {
  const NotificationsSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationsSheet> createState() => _NotificationsSheetState();
}

class _NotificationsSheetState extends State<NotificationsSheet> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadius,
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'الإشعارات',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                notifications.isEmpty
                    ? const Text('لا توجد إشعارات جديدة')
                    : Expanded(
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var notification = notifications[index];
                            return DismissibleWidget(
                              notification: notification,
                              child: NotificationWidget(
                                notification: notification,
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
                          itemCount: notifications.length > 3
                              ? 3
                              : notifications.length,
                        ),
                      ),
                if (notifications.isNotEmpty) ...[
                  const SizedBox(height: 20.0),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text('View all notifications'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      );
                    },
                  ),
                ]
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
