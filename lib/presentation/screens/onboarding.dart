import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Ensure you import this if using .h or .w for responsive design
import 'package:itlala/core/utils/constant/app_colors.dart';
import 'package:itlala/presentation/imports.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.whiteColor,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              return Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      AppImages.onBoarding,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 24.h, horizontal: 22.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 236.w,
                            height: 62.h,
                            child: Text(
                              AppString.onBoarding,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          SizedBox(
                            height: 72.h,
                            width: 255.h,
                            child: Text(
                              AppString.titleBoarding,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          CustomButton(
                            text: AppString.letsStart,
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
