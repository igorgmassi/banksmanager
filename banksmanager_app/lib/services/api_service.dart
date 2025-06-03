import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/banking'; 


  static Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    return await http.get(url,
                          headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },);
  }

  static Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    return await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: convert.jsonEncode(data),
  );
  }

  static Future<http.Response> delete(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    return await http.delete(url);
  }

  static Future<http.Response> put(String endpoint, Map<String, dynamic> data) async {
  final url = Uri.parse('$baseUrl/$endpoint');
  return await http.put(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: convert.jsonEncode(data),
  );
}
}