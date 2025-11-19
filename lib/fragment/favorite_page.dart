import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_32/controller/favorite_controller.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_card.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_text.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favController = Get.find<FavoriteController>();

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Favorite List",
          size: 20,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 95, 226, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Obx(() {
        if (favController.favorites.isEmpty) {
          return const Center(
            child: CustomText(
              text: "Tidak ada Favorite",
              size: 18,
              color: Color.fromARGB(221, 255, 255, 255),
              weight: FontWeight.bold,
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: favController.favorites.length,
          itemBuilder: (context, index) {
            final show = favController.favorites[index];

            return CustomCard(
              // imageUrl: show["image"],
              title: show["name"],
              subtitle: "Language: ${show["language"]} | Genres: ${show["genres"]}",
              isFavorite: true,
              onFavorite: () => favController.toggleFavorite(show),
            );
          },
        );
      }),
    );
  }
}