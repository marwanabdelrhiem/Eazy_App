import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://easy.syntecheg.com/api"; // أو دومينك الجديد

  /// GET
  Future<Map<String, dynamic>> get(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers ?? {"Accept": "application/json"},
    );
    return _handleResponse(response);
  }

  /// POST with Form Data
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body,
      {Map<String, String>? headers}) async {
    final response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: headers ?? {"Accept": "application/json"},
      body: body, // هنا بيسمح تبعت Map<String,String> أو dynamic بسيطة
    );
    return _handleResponse(response);
  }

  /// POST with JSON
  Future<Map<String, dynamic>> postJson(String endpoint,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final response = await http.post(
      Uri.parse("$baseUrl$endpoint"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        ...?headers,
      },
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  /// Handle Response
  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception("Error ${response.statusCode}: ${response.reasonPhrase}\n${response.body}");
    }
  }
}
