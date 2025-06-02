import 'package:flutter/material.dart';

class AccountProvider with ChangeNotifier {
  List<Map<String, dynamic>> _accounts = [];

  List<Map<String, dynamic>> get accounts => _accounts;

  void loadAccounts() {
    // Carregar contas de uma API ou base local
    _accounts = [
      {'id': 1, 'name': 'Conta Corrente', 'balance': 1200.50},
      {'id': 2, 'name': 'Poupança', 'balance': 3000.00},
    ];
    notifyListeners();
  }

  void addAccount(Map<String, dynamic> account) {
    _accounts.add(account);
    notifyListeners();
  }
}
