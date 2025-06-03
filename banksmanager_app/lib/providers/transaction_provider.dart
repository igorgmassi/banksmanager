import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  // Example state or data
  List<String> _transactions = ['Compra X', 'Pagamento Y'];

  List<String> get transactions => _transactions;

  void addTransaction(String transactionDetail) {
    _transactions.add(transactionDetail);
    notifyListeners();
  }
  // Add methods for fetching, filtering, etc.
}