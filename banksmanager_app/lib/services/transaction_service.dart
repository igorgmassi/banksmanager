import 'package:banksamanager_app/models/transaction.dart';
import 'package:banksamanager_app/services/api_service.dart';
import 'dart:convert' as convert;

class TransactionService {
  static Future<List<Transaction>> getTransactions() async {
    final response = await ApiService.get('transactions/');
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as List<dynamic>;
      return jsonData.map((json) => Transaction.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  static Future<Transaction> getTransaction(num id) async {
    final response = await ApiService.get('transactions/$id');
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as Map<String, dynamic>;
      return Transaction.fromJson(jsonData);
    } else {
      throw Exception('Failed to load transaction');
    }
  }

  static Future<Transaction> createTransaction(Transaction transaction) async {
    final response = await ApiService.post('transactions/', transaction.toJson());
    if (response.statusCode == 201) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as Map<String, dynamic>;
      return Transaction.fromJson(jsonData);
    } else {
      throw Exception('Failed to create transaction');
    }
  }

  static Future<void> deleteTransaction(num id) async {
    final response = await ApiService.delete('transactions/$id');
    if (response.statusCode != 204) {
      throw Exception('Failed to delete transaction');
    }
  }
}