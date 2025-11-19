import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pas_mobile_11pplg2_32/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashscreenController extends GetxController {
@override
void onInit() {
  super.onInit();
  Future.delayed(const Duration(seconds: 2), () {
    checkLoginStatus();
  });
}
void checkLoginStatus() async {
  await Future.delayed(const Duration(milliseconds: 800));
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token"); 

  if (token != null && token.isNotEmpty) {
    print('Auto login (normal) with token: $token');
    Get.offAllNamed(AppRoutes.bottomnav);
    return;
  }

  Get.offAllNamed(AppRoutes.login);
}

}