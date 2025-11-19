import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_32/controller/tvshow_controller.dart';

class TvshowBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>TvshowController());
  }
  
}