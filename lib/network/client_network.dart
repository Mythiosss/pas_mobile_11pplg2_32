import 'package:http/http.dart' as http;

class ClientNetwork {
  static const String baseUrl = "https://mediadwi.com/api/";

  static Future<http.Response> postRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(url, body: body);
    return response;
  }
}
