import 'package:events_app/data/models/notification_model.dart';
import 'package:flutter/material.dart';

class DismissibleWidget extends StatelessWidget {
  const DismissibleWidget({
    Key? key,
    required this.child,
    required this.notification,
    required this.onDismissed,
  }) : super(key: key);

  final Widget child;
  final NotificationModel notification;
  final Function(DismissDirection) onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      background: _buildSwipeActionLeft(),
      child: child,
    );
  }

  Widget _buildSwipeActionLeft() => Container(
        alignment: Alignment.centerLeft,
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Image.asset('assets/images/remove.png'),
      );
}
