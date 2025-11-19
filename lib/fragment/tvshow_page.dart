import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_32/controller/favorite_controller.dart';
import 'package:pas_mobile_11pplg2_32/controller/tvshow_controller.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_card.dart';
import 'package:pas_mobile_11pplg2_32/widgets/custom_text.dart';
import 'package:pas_mobile_11pplg2_32/widgets/loading_widget.dart';

class TvshowPage extends StatelessWidget {
  const TvshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final favController = Get.find<FavoriteController>();
    final c = Get.find<TvshowController>();

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "TV Show List",
          size: 20,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 81, 247, 253),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Obx(() {
        if (c.isLoading.value) return const LoadingWidget();

        if (c.showList.isEmpty) {
          return const Center(
            child: CustomText(
              text: "Tidak ada data ditemukan.",
              size: 16,
              color: Colors.black54,
            ),
          );
        }

        return RefreshIndicator(
          color: const Color.fromARGB(255, 104, 243, 224),
          onRefresh: () async => c.fetchShowList(),
          child: ListView.builder(
            itemCount: c.showList.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final show = c.showList[index];

              return Obx(() {
                return CustomCard(
                  // imageUrl: show["image"] ?? "",
                  title: show["name"] ?? "No Title",
                  subtitle:
                      "Language: ${show["language"] ?? '-'} | Genre: ${show["genres"] ?? ''}",
                  isFavorite: favController.isFavorite(show),
                  onFavorite: () {
                    favController.toggleFavorite(show);
                  },
                );
              });
            },
          ),
        );
      }),
    );
  }
}