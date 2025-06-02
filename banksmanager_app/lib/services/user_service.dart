import 'package:banksamanager_app/models/user.dart';
import 'package:banksamanager_app/services/api_service.dart';


class UserService {
  static Future<List<User>> getUsers() async {
  final response = await ApiService.get('users');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.body as List;
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
  static Future<User> getUser(String id) async {
    final response = await ApiService.get('users/$id/');

    if (response.statusCode == 200) {
      return User.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load user');
    }
  }
  static Future<User> createUser(User user) async {
    final response = await ApiService.post('users', user.toJson());

    if (response.statusCode == 201) {
      return User.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create user');
    }
  }
  static Future<void> deleteUser(String id) async {
    final response = await ApiService.delete('users/$id');

    if (response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }
  }
}