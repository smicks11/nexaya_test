import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexaya/modules/splash/viewmodel/splash_vm.dart';
import 'package:nexaya/shared/assets.dart';
import 'package:nexaya/shared/colors.dart';
import 'package:nexaya/shared/size.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SizedBox(
        height: deviceHeight(context) * 1.0.h,
        width: deviceWidth(context) * 1.0.w,
        child: Column(
          children: [
            const Spacer(flex: 2,),
            RichText(
                text: TextSpan(
              style: GoogleFonts.radley(
                  decoration: TextDecoration.none,
                  fontSize: 55.sp,
                  color: AppColors.white),
              children: <TextSpan>[
                TextSpan(
                  text: 'Welcome\n',
                  style: TextStyle(fontSize: 55.sp, color: AppColors.white),
                ),
                TextSpan(
                  text: 'To\n',
                  style: TextStyle(fontSize: 30.sp, color: AppColors.white),
                ),
                TextSpan(
                  text: 'Our Shop',
                  style: TextStyle(fontSize: 30.sp, color: AppColors.white),
                ),
              ],
            ), textAlign: TextAlign.center,),
            const Spacer(flex: 1),
            Image.asset(ImageAssets.logoPng),
            const Spacer(flex: 1),
            SvgPicture.asset(ImageAssets.logoText),
            const Spacer(flex: 2,),

          ],
        ),
      ),
    ));
  }
}
