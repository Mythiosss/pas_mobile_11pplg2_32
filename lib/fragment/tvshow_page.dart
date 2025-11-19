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
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const CustomText(
          text: "TV Shows",
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
              size: 26,
            ),
            onPressed: () => c.fetchShowList(),
            tooltip: 'Refresh',
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5FBFF),
      body: Obx(() {
        if (c.isLoading.value) {
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
            child: const LoadingWidget(),
          );
        }

        if (c.showList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE3F5FF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.tv_rounded,
                    size: 60,
                    color: Color(0xFF5FE2FF),
                  ),
                ),
                const SizedBox(height: 24),
                const CustomText(
                  text: "No TV Shows Found",
                  size: 22,
                  color: Color(0xFF2C3E50),
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: CustomText(
                    text: "Pull down to refresh and load shows",
                    size: 15,
                    color: Color(0xFF7F8C8D),
                    weight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => c.fetchShowList(),
                  icon: const Icon(Icons.refresh_rounded, size: 20),
                  label: const Text(
                    'Refresh Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5FE2FF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 4,
                    shadowColor: const Color(0xFF5FE2FF).withOpacity(0.4),
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
          child: RefreshIndicator(
            color: const Color(0xFF5FE2FF),
            backgroundColor: Colors.white,
            strokeWidth: 3,
            displacement: 40,
            onRefresh: () async => c.fetchShowList(),
            child: ListView.builder(
              itemCount: c.showList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final show = c.showList[index];

                return Obx(() {
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
                      imageUrl: show["image"]["medium"] ?? "",
                      title: show["name"] ?? "No Title",
                      subtitle:
                          "Language: ${show["language"] ?? '-'} | Genre: ${show["genres"] ?? ''}",
                      isFavorite: favController.isFavorite(show),
                      onFavorite: () {
                        favController.toggleFavorite(show);
                      },
                    ),
                  );
                });
              },
            ),
          ),
        );
      }),
    );
  }
}