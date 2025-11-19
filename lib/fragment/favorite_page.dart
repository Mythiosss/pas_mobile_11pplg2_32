import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_32/controller/favorite_controller.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_card.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_text.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  String getGenres(dynamic genres) {
    if (genres == null) return "-";
    if (genres is List) return genres.join(", ");
    return genres.toString();
  }

  String getImageUrl(dynamic show) {
    final img = show["image"];

    // Jika masih MAP
    if (img is Map) {
      return img["medium"] ?? img["original"] ?? "";
    }

    // Jika sudah STRING dari database
    if (img is String) {
      return img;
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    final favController = Get.find<FavoriteController>();

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const CustomText(
          text: "My Favorites",
          size: 22,
          weight: FontWeight.w700,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5FE2FF),
        elevation: 0,
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
      backgroundColor: const Color(0xFFF5FBFF),
      body: Obx(() {
        if (favController.favorites.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F5FF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border_rounded,
                    size: 60,
                    color: Color(0xFF5FE2FF),
                  ),
                ),
                const SizedBox(height: 24),
                const CustomText(
                  text: "No Favorites Yet",
                  size: 22,
                  color: Color(0xFF2C3E50),
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: CustomText(
                    text: "Start adding your favorite shows!",
                    size: 15,
                    color: Color(0xFF7F8C8D),
                    weight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
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
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: favController.favorites.length,
            itemBuilder: (context, index) {
              try {
                final show = favController.favorites[index];
                
                // Debug print
                print("Show $index: $show");

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF5FE2FF).withOpacity(0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CustomCard(
                    imageUrl: getImageUrl(show),
                    title: (show["name"] ?? "-").toString(),
                    subtitle: "Language: ${show["language"] ?? "-"} | Genres: ${getGenres(show["genres"])}",
                    isFavorite: true,
                    onFavorite: () => favController.toggleFavorite(show),
                  ),
                );
              } catch (e) {
                print("Error building item $index: $e");
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFFFCDD2),
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.error_outline,
                      color: Color(0xFFEF5350),
                    ),
                    title: const Text(
                      "Error loading item",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    subtitle: Text(
                      e.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF7F8C8D),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        );
      }),
    );
  }
}