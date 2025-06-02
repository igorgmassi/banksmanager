import 'package:flutter/material.dart';

class LoanProvider with ChangeNotifier {
  List<Map<String, dynamic>> _loans = [];

  List<Map<String, dynamic>> get loans => _loans;

  void loadLoans() {
    _loans = [
      {'id': 1, 'amount': 5000.00, 'dueDate': DateTime.now().add(Duration(days: 30))},
    ];
    notifyListeners();
  }

  void addLoan(Map<String, dynamic> loan) {
    _loans.add(loan);
    notifyListeners();
  }
}
