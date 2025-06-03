import 'package:flutter/material.dart';
import '../models/account.dart';

class AccountProvider extends ChangeNotifier {
  final List<Account> _accounts = [
    Account(
      id: 7,
      balance: 696.90,
      accountnumber: '751829387',
      accounttype: 'Poupança',
      user: 1, // Referência a Adrian Tenis Malavasi
    ),
    Account(
      id: 6,
      balance: 10500.67,
      accountnumber: '732619284',
      accounttype: 'Corrente',
      user: 1,
    ),
    Account(
      id: 5,
      balance: 432.50,
      accountnumber: '321947213',
      accounttype: 'Corrente',
      user: 2, // Luiz Felipe Foeger
    ),
    Account(
      id: 4,
      balance: 9374.20,
      accountnumber: '174291723',
      accounttype: 'Poupança',
      user: 2,
    ),
    Account(
      id: 3,
      balance: 6231.49,
      accountnumber: '582673548',
      accounttype: 'Poupança',
      user: 3, // Igor Gonçalves Massi
    ),
    Account(
      id: 2,
      balance: 1890.50,
      accountnumber: '987654321',
      accounttype: 'Corrente',
      user: 3,
    ),
    Account(
      id: 1,
      balance: 500.00,
      accountnumber: '123456789',
      accounttype: 'Corrente',
      user: 3,
    ),
  ];

  List<Account> get accounts => _accounts;

  void addAccount(Account account) {
    _accounts.add(account);
    notifyListeners();
  }
}
