
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_32/controller/login_controller.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_text.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_textfield.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, 
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                children: [
                  const SizedBox(height: 10),

                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Color.fromARGB(255, 95, 238, 251), 
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 18),

                  const CustomText(
                    text: "Selamat Datang Kembali!",
                    size: 22,
                    weight: FontWeight.bold,
                    color: Color.fromARGB(255, 15, 183, 229), 
                  ),

                  const SizedBox(height: 25),

                  CustomTextfield(
                    label: "Username",
                    controller: loginController.usernameController,
                    icon: Icons.person,
                  ),

                  const SizedBox(height: 15),

                  CustomTextfield(
                    label: "Password",
                    controller: loginController.passwordController,
                    isPassword: true,
                    icon: Icons.lock,
                  ),

                  const SizedBox(height: 25),

                  Obx(() {
                    if (loginController.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 123, 222, 249), 
                        ),
                      );
                    }
                    
                    return CustomButton(
                      text: "Login",
                      color: const Color.fromARGB(255, 123, 222, 249), 
                      icon: Icons.login,
                      onPressed: loginController.login,
                    );
                        
                  }
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                      text: "Register",
                      color: const Color.fromARGB(255, 123, 222, 249), 
                      icon: Icons.app_registration_rounded,
                      onPressed: loginController.registerroutes,
                    ),
                  
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
