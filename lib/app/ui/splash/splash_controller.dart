import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../../routes/app_pages.dart';
import '../../utils/utils.dart';
import '../ui.dart';

class SplashController extends BaseController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await getConfig();
    await getProfile();
    // autoRegisterAccount(50);
  }

  Future<void> getConfig() async {}

  Future<void> getProfile() async {
    final NetworkState<dynamic> networkState = await AuthRepository().authorized();
    if (networkState.isSuccess) {
      Get.offAndToNamed(Routes.NAVIGATION);
    } else {
      Get.offAndToNamed(Routes.LOGIN_REGISTER);
    }
  }

  Future<void> autoRegisterAccount(int count) async {
    for(int i = 0; i < count; i++){
      final Map<String, String> account = AppEmail().createEmailAndName();
      AuthRepository().register(name: account['name']!, email: account['email']!, password: 'Aa22032001!');
    }
  }
}
