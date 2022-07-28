// ignore_for_file: use_key_in_widget_constructors, flutter_style_todos
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../ui.dart';

class SplashScreen extends BaseScreen<SplashController> {
  @override
  Widget? builder() {
    // TODO: implement builder
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(AppImages.png('app_icon'), scale: 2,),
            // Text('app_slogan'.tr, style: AppTextStyles.normalBold.copyWith(fontSize: 30, color: AppColors.primary),)
          ],
        ),
      ),
    );
  }
}
