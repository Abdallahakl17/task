import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart'; // استيراد الحزمة المطلوبة
import 'package:itlala/core/utils/constant/app_colors.dart';
import 'package:itlala/presentation/imports.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
     // تغيير لون الشريط العلوي
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.splashColor, // تغيير لون الشريط العلوي
      statusBarIconBrightness: Brightness.light,
    ));
      Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColor.splashColor,
              child: Center(
                child: Image.asset(
                  AppImages.logo,
                  cacheHeight:
                      (45.h).toInt(), // استخدم ScreenUtil لتحديد الأبعاد
                  cacheWidth: (145.w).toInt(),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
