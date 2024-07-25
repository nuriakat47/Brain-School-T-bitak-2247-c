import 'package:flutter/material.dart';
import 'package:brain_school/screens/login_screen/login_screen.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pİ ANATOMİ', style: Theme.of(context).textTheme.headline5),
                  Text('VR', style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/pi_vr_logo.jpeg',
                height: 25.h,
                width: 50.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
