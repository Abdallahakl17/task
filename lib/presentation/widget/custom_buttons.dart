// ignore_for_file: must_be_immutable

import 'package:itlala/presentation/imports.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.radius = 12,
      required this.text,
      this.onTapped,
      this.heigth = 50,
      this.width = double.infinity});
  double radius;
  double heigth;
  double width;
  String text;
  void Function()? onTapped;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        height: heigth,
        width: width,
        // height: 44,
        // width: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.splashColor,
            borderRadius: BorderRadius.all(Radius.circular(radius.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            
                Padding(
                  padding:   EdgeInsets.symmetric(horizontal: 8.w),
                  child: Image.asset(AppImages.arrowRigth, width: 24.w, height: 24.h),
                )
,
            
          ],
        ),
      ),
    );
  }
}
