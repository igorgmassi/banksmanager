import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  // Example state or data
  List<String> _accounts = ['Conta Corrente', 'Poupança'];

  List<String> get accounts => _accounts;

  void addAccount(String accountName) {
    _accounts.add(accountName);
    notifyListeners();
  }
  // Add methods for fetching, updating, deleting accounts
}