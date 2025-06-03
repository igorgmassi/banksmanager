import 'package:banksamanager_app/models/account.dart';
import 'package:banksamanager_app/services/account_service.dart';
import 'package:flutter/material.dart';

class AccountProvider with ChangeNotifier {
  final List<Account> _accounts = [];

  List<Account> get accounts => _accounts;

  void loadAccounts() async {
    try {
      List<Account> newAccounts = await AccountService.getAccounts();
      _accounts.clear();
      _accounts.addAll(newAccounts);
      notifyListeners();
    } catch (error) {
      print('Error loading accounts: $error');
    }

  }

  void addAccount(Account newAccount) {
    AccountService.createAccount(newAccount).then((createdAccount) {
      _accounts.add(createdAccount);
      notifyListeners();
    }).catchError((error) {
      print('Error adding account: $error');
    });
  }

  void deleteAccount(num id) {
    AccountService.deleteAccount(id).then((_) {
      _accounts.removeWhere((account) => account.id == id);
      notifyListeners();
    }).catchError((error) {
      print('Error deleting account: $error');
    });
  }
}
