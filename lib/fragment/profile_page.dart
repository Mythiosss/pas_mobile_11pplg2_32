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
      extendBodyBehindAppBar: false,
      backgroundColor: const Color(0xFFF5FBFF),
      appBar: AppBar(
        title: const CustomText(
          text: "My Profile",
          size: 22,
          weight: FontWeight.w700,
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF5FE2FF),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF5FE2FF),
                Color(0xFF45D4F7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFF5FBFF),
              const Color(0xFFE3F5FF).withOpacity(0.3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Obx(() {
              return Container(
                width: 340,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF5FE2FF).withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Avatar dengan gradient border
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF5FE2FF),
                            Color(0xFF45D4F7),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF5FE2FF).withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(controller.localImage.value),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Name
                    CustomText(
                      text: controller.name.value,
                      size: 26,
                      weight: FontWeight.w700,
                      color: const Color(0xFF2C3E50),
                    ),

                    const SizedBox(height: 6),

                    // Email
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F5FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomText(
                        text: controller.email.value,
                        size: 15,
                        weight: FontWeight.w500,
                        color: const Color(0xFF5FE2FF),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Divider
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            const Color(0xFF5FE2FF).withOpacity(0.3),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                   // Logout Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: controller.showLogoutDialog,
                        icon: const Icon(
                          Icons.logout_rounded,
                          size: 20,
                        ),
                        label: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6B6B),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                          shadowColor: const Color(0xFFFF6B6B).withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 28,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}