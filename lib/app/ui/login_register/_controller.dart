import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../../routes/app_pages.dart';
import '../../utils/app_utils.dart';
import '../ui.dart';

class LoginRegisterController extends BaseController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final AuthRepository authRepository = AuthRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final RxBool isRegister = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void clearTextField() {
    userNameController.text = '';
    passwordController.text = '';
    rePasswordController.text = '';
    formKey.currentState!.reset();
  }

  void changeStateLoginRegister() {
    unFocus();
    isRegister.value = !isRegister.value;
    clearTextField();
  }

  Future<void> registerAccount() async {
    unFocus();
    if(formKey.currentState!.validate()) {
      final dynamic next = await confirm();
      if (next == true) {
        setLoading(true);
        final NetworkState<dynamic> networkState = await authRepository.register(
          email: userNameController.text,
          password: passwordController.text,
          name: nameController.text,
        );
        setLoading(false);
        if (networkState.isSuccess) {
          AppUtils.toast('Success');
          Get.offAndToNamed(Routes.NAVIGATION);
        } else {
          notification(networkState.message!);
        }
      }
    }
  }

  Future<void> loginNormal() async {
    unFocus();
    if(formKey.currentState!.validate()) {
      setLoading(true);
      final NetworkState<dynamic> networkState = await authRepository.loginNormal(
        email: userNameController.text,
        password: passwordController.text,
      );
      setLoading(false);
      if (networkState.isSuccess) {
        AppUtils.toast('Success');
        Get.offAndToNamed(Routes.NAVIGATION);
      } else {
        notification(networkState.message!);
      }
    }
  }

  Future<void> loginSocial(SocialType type) async {
    LoginSocialResult? loginSocialResult;

    switch(type){
      case SocialType.google:
        loginSocialResult = await SocialService().signInGoogle();
        break;
      case SocialType.facebook:
        loginSocialResult = await SocialService().signInFacebook();
        break;
      case SocialType.twitter:
        break;
      case SocialType.apple:
        break;
    }
    if(loginSocialResult?.id != null){
      setLoading(true);
      final NetworkState<dynamic> networkState = await authRepository.loginSocial(
          socialToken: loginSocialResult!.accessToken!,
          accountType: AppUtils.getNameOfEnumValue(type),
      );
      setLoading(false);
      if (networkState.isSuccess) {
        AppUtils.toast('Success');
        Get.offAllNamed(Routes.NAVIGATION);
      } else {
        notification(networkState.message!);
      }
    }
  }

}
