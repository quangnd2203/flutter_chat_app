// ignore_for_file: always_specify_types, strict_raw_type

import 'package:get/get.dart';
import '../ui/ui.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();
  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.NAVIGATION,
      page: () => NavigationScreen(),
      bindings: [
        NavigationBinding(),
        MessageBinding(),
        ContactListBinding(),
        ProfileBinding(),
      ]
    ),
    GetPage(
      name: Routes.LOGIN_REGISTER,
      page: () => LoginRegisterScreen(),
      binding: LoginRegisterBinding(),
    ),
    GetPage(
      name: Routes.MESSAGE_ROOM,
      page: () => MessageRoomScreen(),
      binding: MessageRoomBinding(),
    ),
    GetPage(
      name: Routes.PROFILE_CHANGE_INFO,
      page: () => ProfileChangInfoScreen(),
      binding: ProfileChangInfoBinding(),
    ),
  ];
}
