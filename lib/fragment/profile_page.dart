import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_32/controller/login_controller.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_button.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_text.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
      appBar: AppBar(
        title: CustomText(
          text: "Profile",
          size: 20,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 84, 241, 234),
      ),

      body: Center(
        child: Obx(() {
          return Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 68, 255, 236),
                  ),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage(controller.localImage.value),
                  ),
                ),

                const SizedBox(height: 20),

                CustomText(
                  text: controller.name.value,
                  size: 24,
                  weight: FontWeight.bold,
                  color: Colors.black87,
                ),
                CustomText(
                  text: controller.email.value,
                  size: 24,
                  weight: FontWeight.bold,
                  color: Colors.black87,
                ),

                const SizedBox(height: 25),

                CustomButton(
                  text: "Logout",
                  color: Colors.redAccent,
                  onPressed: controller.showLogoutDialog,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}