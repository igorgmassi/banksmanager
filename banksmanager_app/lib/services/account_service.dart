import 'package:banksamanager_app/models/account.dart';
import 'package:banksamanager_app/services/api_service.dart';
import 'dart:convert' as convert;

class AccountService {
  static Future<List<Account>> getAccounts() async {
    final response = await ApiService.get('accounts');
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as List<dynamic>;
      return jsonData.map((json) => Account.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load accounts');
    }
  }

  static Future<Account> getAccount(String id) async {
    final response = await ApiService.get('accounts/$id');
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as Map<String, dynamic>;
      return Account.fromJson(jsonData);
    } else {
      throw Exception('Failed to load account');
    }
  }

  static Future<Account> createAccount(Account account) async {
    final response = await ApiService.post('accounts', account.toJson());
    if (response.statusCode == 201) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as Map<String, dynamic>;
      return Account.fromJson(jsonData);
    } else {
      throw Exception('Failed to create account');
    }
  }

  static Future<void> deleteAccount(String id) async {
    final response = await ApiService.delete('accounts/$id');
    if (response.statusCode != 204) {
      throw Exception('Failed to delete account');
    }
  }
}