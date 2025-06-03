import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/loan.dart';
import 'package:banksamanager_app/services/loan_service.dart';


class LoanProvider with ChangeNotifier {
  final List<Loan> _loans = [];

  List<Loan> get loans => _loans;

  void loadLoans() async {
    try {
      List<Loan> newLoans = await LoanService.getLoans();
      _loans.clear();
      _loans.addAll(newLoans);
      notifyListeners();
    } catch (error) {
      print('Error loading loans: $error');
    }
  }

  void addLoan(Loan newLoan) {
    LoanService.createLoan(newLoan).then((createdLoan) {
      _loans.add(createdLoan);
      notifyListeners();
    }).catchError((error) {
      print('Error adding loan: $error');
    });
  }

  void deleteLoan(num id) {
    LoanService.deleteLoan(id).then((_) {
      _loans.removeWhere((loan) => loan.id == id);
      notifyListeners();
    }).catchError((error) {
      print('Error deleting loan: $error');
    });
  }
}
