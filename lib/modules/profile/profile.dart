import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nexaya/modules/profile/viewmodel/profile_vm.dart';
import 'package:nexaya/shared/assets.dart';
import 'package:nexaya/shared/colors.dart';
import 'package:nexaya/shared/size.dart';
import 'package:nexaya/shared/text.dart';
import 'package:stacked/stacked.dart';
import 'widget/profile_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(context),
        onViewModelReady: (model) => model.initializaData(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.bgColor,
              appBar: AppBar(
                backgroundColor: AppColors.bgColor,
              ),
              body: SafeArea(
                child: SizedBox(
                  height: deviceHeight(context) * 1.0,
                  width: deviceWidth(context) * 1.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          S.h(20.h),
                          CircleAvatar(
                              radius: 40.r,
                              backgroundImage:
                                  const AssetImage(ImageAssets.logoPng)),
                          S.h(20.h),
                          TextView(
                            text: model.signInPayload?.data.name ?? "",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          S.h(15.h),
                          TextView(
                              text: model.signInPayload?.data.role ?? "",
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                          S.h(14.h),
                          ProfileTiles(
                            title: 'Name',
                            data: model.signInPayload?.data.name ?? "",
                          ),
                          ProfileTiles(
                            title: 'ID',
                            data: model.signInPayload?.data.id ?? "",
                          ),
                          ProfileTiles(
                            title: 'Avatar',
                            data: model.signInPayload?.data.avartar ?? "",
                          ),
                          ProfileTiles(
                            title: 'Role',
                            data: model.signInPayload?.data.role ?? "",
                          ),
                          S.h(50.h)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
