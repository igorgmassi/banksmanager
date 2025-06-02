import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userToken;

  bool get isAuthenticated => _isAuthenticated;
  String? get userToken => _userToken;

  Future<void> login(String username, String password) async {
    // Simulação de login
    // Aqui você faria chamada API, validação, etc.
    _isAuthenticated = true;
    _userToken = 'token_de_exemplo';
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _userToken = null;
    notifyListeners();
  }
}
