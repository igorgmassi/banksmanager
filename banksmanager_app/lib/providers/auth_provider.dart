import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String username, String password) async {
    // Simulate an API call
    await Future.delayed(const Duration(seconds: 1));

    // Replace with your actual authentication logic
    if (username == 'test' && password == 'password') {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    notifyListeners(); // Notify listeners of state change
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}