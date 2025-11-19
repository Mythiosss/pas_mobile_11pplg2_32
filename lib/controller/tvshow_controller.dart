import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TvshowController extends GetxController {
  var isLoading = false.obs;
  var showList = [].obs;

  final String url = "https://api.tvmaze.com/shows";

  @override
  void onInit() {
    fetchShowList();
    super.onInit();
  }

  Future<void> fetchShowList() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        showList.value = jsonData.cast<Map<String, dynamic>>();
      } else {
        Get.snackbar("Error", "Gagal memuat data (${response.statusCode})");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading(false);
    }
  }
}