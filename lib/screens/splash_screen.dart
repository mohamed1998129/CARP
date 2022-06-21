import 'package:carp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(

        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image.asset('assets/logo.png',
            width: 200,
            height: 250,
            fit: BoxFit.contain,),
        ],
      ),


      backgroundColor:Colors.yellow,
      duration: 1500,
      //splashTransition: SplashTransition.slideTransition,
      splashIconSize: 250,
      animationDuration: Duration(seconds: 1),
      nextScreen: Directionality(child: LoginScreen(),
        textDirection: TextDirection.ltr,
      ),

    );
  }
}
