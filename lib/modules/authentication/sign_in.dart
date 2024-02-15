import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexaya/core/helper/validators.dart';
import 'package:nexaya/shared/assets.dart';
import 'package:nexaya/shared/colors.dart';
import 'package:nexaya/shared/size.dart';
import 'package:nexaya/shared/text.dart';
import 'package:stacked/stacked.dart';
import 'viewmodel/authentication_vm.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.reactive(
        viewModelBuilder: () => AuthenticationViewModel(context),
        builder: (context, model, child) => Scaffold(
            backgroundColor: AppColors.bgColor,
            body: SafeArea(
              child: SizedBox(
                height: deviceHeight(context) * 1.0.h,
                width: deviceWidth(context) * 1.0.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        S.h(20.h),
                        Image.asset(
                          ImageAssets.logoPng,
                          height: 120.h,
                          width: 120.w,
                        ),
                        S.h(8.h),
                        SvgPicture.asset(ImageAssets.logoText),
                        S.h(35.h),
                        Center(
                          child: TextView(
                            text: 'Sign In',
                            color: AppColors.secondaryColor,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        S.h(10.h),
                        Center(
                          child: TextView(
                              text: 'Hi there! Nice to see you again.',
                              color: AppColors.disabledTextColor,
                              fontSize: 15.sp),
                        ),
                        S.h(30.h),
                        _form(model),
                        S.h(55.h),
                        InkResponse(
                          onTap: () {
                            if (model.signInFormKey.currentState!.validate()) {
                              model.signIn();
                            }
                          },
                          child: Container(
                            width: 166.w,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.white, width: .8),
                                color: AppColors.buttonColor),
                            child: model.isBusy
                                ? SizedBox(
                                    height: 25.h,
                                    width: 25.w,
                                    child: const CircularProgressIndicator
                                        .adaptive())
                                : TextView(
                                    text: 'Sign In',
                                    fontSize: 14.sp,
                                    color: AppColors.white,
                                  ),
                          ),
                        ),
                        S.h(14.h),
                        Center(
                          child: TextView(
                            text: 'Or',
                            fontSize: 16.sp,
                            color: AppColors.white,
                          ),
                        ),
                        S.h(14.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(ImageAssets.instagram),
                            S.w(8.w),
                            SvgPicture.asset(ImageAssets.fb),
                            S.w(8.w),
                            SvgPicture.asset(ImageAssets.twitter),
                            S.w(8.w),
                            SvgPicture.asset(ImageAssets.gmail),
                          ],
                        ),
                        S.h(35.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: TextView(
                                  text: 'Forgot Password ?',
                                  color: AppColors.purpleColor,
                                  fontSize: 16.sp,
                                )),
                            TextButton(
                                onPressed: () {},
                                child: TextView(
                                  text: 'Sign Up',
                                  color: AppColors.secondaryColor,
                                  fontSize: 16.sp,
                                )),
                          ],
                        ),
                        S.h(50.h),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  Form _form(AuthenticationViewModel model) {
    return Form(
      key: model.signInFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: model.emailCtrl,
            validator: MyFormValidator.emailValidator,
            style:
                TextStyle(color: AppColors.disabledTextColor, fontSize: 12.sp),
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: AppColors.white, fontSize: 13.sp),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.white),
              ),
            ),
          ),
          S.h(12.h),
          TextFormField(
            controller: model.passwordCtrl,
            obscureText: !model.obsure,
            validator: MyFormValidator.passwordValidator,
            style:
                TextStyle(color: AppColors.disabledTextColor, fontSize: 12.sp),
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: AppColors.white, fontSize: 13.sp),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.white),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.white),
              ),
              suffixIcon: InkResponse(
                onTap: () {
                  model.switchObcure();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextView(
                      text: model.obsure ? 'Hide' : 'Show',
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
