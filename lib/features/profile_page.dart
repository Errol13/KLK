import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});
  
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding (
        padding: EdgeInsets.all(16),
        child: Text("Profile",),
        ),
    );
  }

}