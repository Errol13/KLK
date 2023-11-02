import 'package:flutter/material.dart';
import 'features/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klinikonek',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light(background: Color(0xFFE6E7E8)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// a class for SplashScreen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(
      Duration(seconds: 2), // duration of the splash
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => decideScreen()),
        );
      },
    );
  }

  Widget decideScreen() {
    //other logic when the database is set
    //return the splashpage
    return SplashPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/Logo.png'),
              ],
            ),
          ),

          //precise positioning of the text "Klinikonek"
          Positioned(
            bottom: 16, 
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Klinikonek',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF276A7B),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
