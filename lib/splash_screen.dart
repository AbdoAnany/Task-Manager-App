import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/widgets.dart';
import 'core/di/dependency_injection.dart';
import 'core/theming/colors.dart';
import 'routes/pages.dart';
import 'utils/color_palette.dart';
import 'utils/font_sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }


  startTimer() async {
   bool? isLogin =getIt<SharedPreferences>().getBool('isLogin')??false;
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        isLogin?  Pages.todosScreen:  Pages.loginScreen,
            (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  ColorsManager.primaryColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/app_logo.png', width: 100,),
            const SizedBox(height: 20,),
            buildText('Everything Tasks',  ColorsManager.white, textBold,
                FontWeight.w600, TextAlign.center, TextOverflow.clip),
            const SizedBox(
              height: 10,
            ),
            buildText('Schedule your week with ease',  ColorsManager.white, textTiny,
                FontWeight.normal, TextAlign.center, TextOverflow.clip),
          ],
        )));
  }
}
