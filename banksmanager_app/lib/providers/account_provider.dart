import 'package:banksamanager_app/models/account.dart';
import 'package:banksamanager_app/services/account_service.dart';
import 'package:flutter/material.dart';

class AccountProvider with ChangeNotifier {
  List<Map<String, dynamic>> _accounts = [];

  List<Map<String, dynamic>> get accounts => _accounts;

  Future<List<Account>> loadAccounts() async {
    // Carregar contas de uma API ou base local
    List<Account> accounts = await AccountService.getAccounts();

    notifyListeners();
    return accounts;
  }

  void addAccount(Map<String, dynamic> account) {
    _accounts.add(account);
    notifyListeners();
  }
}
