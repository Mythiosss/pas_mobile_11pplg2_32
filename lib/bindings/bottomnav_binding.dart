import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_32/controller/bottomnav_controller.dart';
import 'package:pas_mobile_11pplg2_32/controller/favorite_controller.dart';
import 'package:pas_mobile_11pplg2_32/controller/login_controller.dart';
import 'package:pas_mobile_11pplg2_32/controller/tvshow_controller.dart';

class BottomnavBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<BottomnavController>(()=> BottomnavController());
    Get.lazyPut<LoginController>(()=> LoginController());
    Get.lazyPut<TvshowController>(()=> TvshowController());
    Get.lazyPut<FavoriteController>(()=> FavoriteController());
  }
  
}