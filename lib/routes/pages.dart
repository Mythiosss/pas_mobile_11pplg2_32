import 'package:get/route_manager.dart';
import 'package:pas_mobile_11pplg2_32/bindings/bottomnav_binding.dart';
import 'package:pas_mobile_11pplg2_32/bindings/favorite_binding.dart';
import 'package:pas_mobile_11pplg2_32/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg2_32/bindings/splashscreen_binding.dart';
import 'package:pas_mobile_11pplg2_32/bindings/tvshow_binding.dart';
import 'package:pas_mobile_11pplg2_32/fragment/favorite_page.dart';
import 'package:pas_mobile_11pplg2_32/fragment/tvshow_page.dart';
import 'package:pas_mobile_11pplg2_32/pages/bottomnav_page.dart';
import 'package:pas_mobile_11pplg2_32/pages/login_page.dart';
import 'package:pas_mobile_11pplg2_32/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_32/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg2_32/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => LoginPage(), bindings: [LoginBinding()],),
    GetPage(name: AppRoutes.bottomnav, page: () => BottomnavPage(), bindings: [BottomnavBinding()],),
    GetPage(name: AppRoutes.splash, page: () => SplashscreenPage(), bindings: [SplashscreenBinding()],),
    GetPage(name: AppRoutes.register, page: () => RegisterPage(), bindings: [LoginBinding()]),
    GetPage(name: AppRoutes.tvshow, page: () => TvshowPage(), bindings: [TvshowBinding()]),
    GetPage(name: AppRoutes.favorite, page: () => FavoritePage(), bindings: [FavoriteBinding()]),
  ];
}