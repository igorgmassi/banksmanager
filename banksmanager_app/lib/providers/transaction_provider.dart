import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  List<Map<String, dynamic>> _transactions = [];

  List<Map<String, dynamic>> get transactions => _transactions;

  void loadTransactions() {
    _transactions = [
      {'id': 1, 'description': 'Pagamento', 'amount': -150.00, 'date': DateTime.now()},
      {'id': 2, 'description': 'Depósito', 'amount': 500.00, 'date': DateTime.now()},
    ];
    notifyListeners();
  }

  void addTransaction(Map<String, dynamic> transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
