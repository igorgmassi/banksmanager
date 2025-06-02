import 'package:banksamanager_app/services/api_service.dart';
import 'dart:convert';

class AuthService {
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await ApiService.post('login/', {
      "email": email,
      "password": password,
    });

    print('Login response: ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception(jsonDecode(response.body)['error'] ?? 'Failed to login');
    }
  }
}
