import 'package:flutter/material.dart';
import 'first_page.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';

class ActualNotificationPage extends StatefulWidget {
  const ActualNotificationPage(
      {super.key}); // Create a StatefulWidget for the Sign-Up page.

  @override
  _ActualNotificationPageState createState() => _ActualNotificationPageState();
}

class _ActualNotificationPageState extends State<ActualNotificationPage> {
  bool notificationsOn = true;
  bool reactionsOn = true; // To track if notifications are on or off

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Notification",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF276A7B),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.calendar_today_rounded),
                        title: Text(
                          'Check up today at 9:00 am',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF276A7B),
                          ),
                        ),
                        subtitle: Text('15 mins ago'),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.circle_notifications_rounded),
                        title: Text(
                          'Medicine Available',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF276A7B),
                          ),
                        ),
                        subtitle: Text('13 hours ago'),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(HumanitarianIcons.ambulance),
                        title: Text(
                          'No available ambulance',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF276A7B),
                          ),
                        ),
                        subtitle: Text('a day ago'),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.comment_rounded),
                        title: Text(
                          'Dr. Celis replied to your comment',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF276A7B),
                          ),
                        ),
                        subtitle: Text('3 days ago'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
