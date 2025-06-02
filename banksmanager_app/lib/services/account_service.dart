import 'package:banksamanager_app/models/account.dart';
import 'package:banksamanager_app/services/api_service.dart';

class AccountService {

  static Future<List<Account>> getAccounts() async {
    final response = await ApiService.get('accounts');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.body as List;
      return data.map((json) => Account.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load accounts');
    }
  }

  static Future<Account> getAccount(String id) async {
    final response = await ApiService.get('accounts/$id');

    if (response.statusCode == 200) {
      return Account.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load account');
    }
  }

  static Future<Account> createAccount(Account account) async {
    final response = await ApiService.post('accounts', account.toJson());

    if (response.statusCode == 201) {
      return Account.fromJson(response.body as Map<String, dynamic>);
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