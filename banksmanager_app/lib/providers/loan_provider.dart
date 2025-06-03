import 'package:flutter/material.dart';

class LoanProvider extends ChangeNotifier {
  // Example state or data
  List<String> _loans = ['Empréstimo Habitação', 'Empréstimo Pessoal'];

  List<String> get loans => _loans;

  void addLoan(String loanDetail) {
    _loans.add(loanDetail);
    notifyListeners();
  }
  // Add methods for loan applications, status, etc.
}