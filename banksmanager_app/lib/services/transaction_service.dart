import 'package:banksamanager_app/models/transaction.dart';
import 'package:banksamanager_app/services/api_service.dart';

class TransactionService {
  static Future<List<Transaction>> getTransactions() async {
    final response = await ApiService.get('transactions');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.body as List;
      return data.map((json) => Transaction.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  static Future<Transaction> getTransaction(String id) async {
    final response = await ApiService.get('transactions/$id');

    if (response.statusCode == 200) {
      return Transaction.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load transaction');
    }
  }

  static Future<Transaction> createTransaction(Transaction transaction) async {
    final response = await ApiService.post('transactions', transaction.toJson());

    if (response.statusCode == 201) {
      return Transaction.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create transaction');
    }
  }

  static Future<void> deleteTransaction(String id) async {
    final response = await ApiService.delete('transactions/$id');

    if (response.statusCode != 204) {
      throw Exception('Failed to delete transaction');
    }
  }
}