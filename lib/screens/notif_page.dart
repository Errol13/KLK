import 'package:flutter/material.dart';
import 'first_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage(
      {super.key}); // Create a StatefulWidget for the Sign-Up page.

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool notificationsOn = true;
  bool reactionsOn = true; // To track if notifications are on or off

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Notification Settings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF276A7B),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildNotificationItem(
              'Reactions',
              'Receive push notifications when someone reacts to your message.',
              reactionsOn,
              (value) {
                setState(() {
                  reactionsOn = value;
                });
              },
            ),
            SizedBox(height: 20), // Adding space between sections
            _buildNotificationItem(
              'Call Logs',
              'Receive push notifications for recent calls.',
              notificationsOn,
              (value) {
                setState(() {
                  notificationsOn = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
    String title,
    String description,
    bool value,
    Function(bool) onChanged,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeTrackColor: Color(0xFF276A7B),
              activeColor: Colors.white,
            ),
          ],
        ),
        Divider(), // Adding a divider between sections
      ],
    );
  }
}
