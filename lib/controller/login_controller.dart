import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_32/model/login_model.dart';
import 'package:pas_mobile_11pplg2_32/model/register_api.dart';
import 'package:pas_mobile_11pplg2_32/network/client_network.dart';
import 'package:pas_mobile_11pplg2_32/routes/routes.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_text.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameControllerregister = TextEditingController();
  final passwordControllerregister = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();

  var isLoading = false.obs;

  var name = "User Default".obs;
  var email = "user@example.com".obs;
  var localImage = "assets/image/profile.png".obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  void register() async {
    isLoading.value = true;

    try {
      final response = await ClientNetwork.postRequest('latihan/register-user', {
            "username": usernameControllerregister.text.trim(),
            "password": passwordControllerregister.text.trim(),
            "full_name": fullNameController.text.trim(),
            "email": emailController.text.trim(),
          });

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (data["status"] == true) {
          final registerData = RegisterApi.fromJson(data);

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString("username", usernameControllerregister.text.trim());
          await prefs.setString("full_name", fullNameController.text.trim());
          await prefs.setString("email", emailController.text.trim());

          Get.offAllNamed(AppRoutes.login);

          Get.snackbar(
            "Register Berhasil!",
            registerData.message,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Register Gagal",
            data["message"],
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

    isLoading.value = false;
  }

  void login() async {
    isLoading.value = true;

    try {
      final response = await ClientNetwork.postRequest('latihan/login', {
        'username': usernameController.text.trim(),
        'password': passwordController.text.trim(),
      });

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (data['status'] == true) {
          final loginData = LoginModel.fromJson(data);
          final prefs = await SharedPreferences.getInstance();

          await prefs.setString('token', loginData.token);
          await prefs.setString('username', usernameController.text.trim());

          name.value = usernameController.text.trim();
          email.value = "${usernameController.text.trim()}@gmail.com";

          Get.offAllNamed(AppRoutes.bottomnav);
        } else {
          Get.snackbar(
            "Login Gagal",
            data["message"],
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }

    isLoading.value = false;
  }

  void loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString("username");

    if (savedUsername != null) {
      name.value = savedUsername;
      email.value = "$savedUsername@gmail.com";
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  void registerroutes() async {
    Get.offAllNamed(AppRoutes.register);
  }

  void showLogoutDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 300, 
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.logout, size: 60, color: Color(0xFFE5810F)),
              const SizedBox(height: 10),

              const CustomText(
                text: "Logout",
                size: 22,
                weight: FontWeight.bold,
                color: Colors.black,
              ),

              const SizedBox(height: 8),

              const CustomText(
                text: "Are you sure you want to logout?",
                size: 16,
                color: Colors.grey,
              ),

              const SizedBox(height: 18),

              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        "Batal",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: CustomButton(
                      text: "Logout",
                      color: Colors.red,
                      onPressed: () {
                        logout();
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
