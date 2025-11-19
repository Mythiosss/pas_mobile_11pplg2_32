import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_32/controller/bottomnav_controller.dart';
import 'package:pas_mobile_11pplg2_32/fragment/favorite_page.dart';
import 'package:pas_mobile_11pplg2_32/fragment/profile_page.dart';
import 'package:pas_mobile_11pplg2_32/fragment/tvshow_page.dart';

class BottomnavPage extends StatelessWidget {
  BottomnavPage({super.key});
  final controller = Get.find<BottomnavController>();

  final pages = [
    TvshowPage(),
    FavoritePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>Scaffold(
        body: pages[controller.selectedIndex.value],
        
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,

          backgroundColor: const Color.fromARGB(255, 116, 255, 241), 
          
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 8,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: "Tv Show List",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
      )
    )
    );
  }
}