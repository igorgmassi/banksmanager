import 'package:banksamanager_app/models/transaction.dart';
import 'package:banksamanager_app/services/transaction_service.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  void loadTransactions() async {
    try {
      List<Transaction> newTransactions = await TransactionService.getTransactions();
      _transactions.clear();
      _transactions.addAll(newTransactions);
      notifyListeners();
    } catch (error) {
      print('Error loading transactions: $error');
    }
  }

  void addTransaction(Transaction newTransaction) {
    TransactionService.createTransaction(newTransaction).then((createdTransaction) {
      _transactions.add(createdTransaction);
      notifyListeners();
    }).catchError((error) {
      print('Error adding transaction: $error');
    });
  }

  void deleteTransaction(num id) {
    TransactionService.deleteTransaction(id).then((_) {
      _transactions.removeWhere((transaction) => transaction.id == id);
      notifyListeners();
    }).catchError((error) {
      print('Error deleting transaction: $error');
    });
  }
}
