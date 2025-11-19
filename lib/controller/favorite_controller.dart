  import 'package:get/get.dart';
  import 'package:pas_mobile_11pplg2_32/helper/db_helper.dart';

  class FavoriteController extends GetxController {
    var favorites = <Map<String, dynamic>>[].obs;
    final _db = FavoriteDB();

    @override
    void onInit() {
      super.onInit();
      loadFavorites();
    }
    Future<void> loadFavorites() async {
      final data = await _db.getFavorites();
      favorites.value = List<Map<String, dynamic>>.from(data);
    }
    bool isFavorite(Map<String, dynamic> item) {
      return favorites.any((fav) => fav["id"] == item["id"]);
    }
    Future<void> toggleFavorite(Map<String, dynamic> item) async {
      final id = item["id"];

      if (isFavorite(item)) {
        await _db.deleteFavorite(id);
        favorites.value =
            favorites.where((fav) => fav["id"] != id).toList();
      } else {
        final newItem = {
          "id": id,
          "name": item["name"] ?? "Unknown",
          "language": item["language"] ?? "-",
          "genres": (item["genres"] is List)
              ? (item["genres"] as List)
                  .map((g) => g.toString().split('.').last) // ENUM → String
                  .join(", ")
              : (item["genres"]?.toString() ?? "-"),
          "image": item["image"] is Map
              ? item["image"]["medium"] ?? item["image"]["original"] ?? ""
              : item["image"]?.toString() ?? "",
        };
        await _db.addFavorite(newItem);

        favorites.value = List<Map<String, dynamic>>.from(favorites)..add(newItem);
      }
    }
  }