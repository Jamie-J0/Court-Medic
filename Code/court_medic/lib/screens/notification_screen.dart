import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.notifications_none, size: 64, color: AppColors.textGrey),
            const SizedBox(height: 16),
            Text('No notifications yet', style: AppTextStyles.heading(context)),
            const SizedBox(height: 8),
            Text("We'll let you know when something new comes up.", style: AppTextStyles.body(context)),
          ],
        ),
      ),
    );
  }
}
