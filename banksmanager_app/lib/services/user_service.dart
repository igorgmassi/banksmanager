import 'package:banksamanager_app/models/user.dart';
import 'package:banksamanager_app/services/api_service.dart';
import 'dart:convert' as convert;

class UserService {
  static Future<List<User>> getUsers() async {
    final response = await ApiService.get('users/');
    print(response);
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as List<dynamic>;
      return jsonData.map((user) => User.fromJson(user as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<User> getUser(num id) async {
    final response = await ApiService.get('users/$id/');
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as Map<String, dynamic>;
      return User.fromJson(jsonData);
    } else {
      throw Exception('Failed to load user');
    }
  }

  static Future<User> createUser(User user) async {
    final response = await ApiService.post('users/', user.toJson());
    if (response.statusCode == 201) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as Map<String, dynamic>;
      return User.fromJson(jsonData);
    } else {
      throw Exception('Failed to create user');
    }
  }

  static Future<void> deleteUser(num id) async {
    final response = await ApiService.delete('users/$id');
    if (response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }
  }

  static getTransactions() {}

  static getCards() {}
}