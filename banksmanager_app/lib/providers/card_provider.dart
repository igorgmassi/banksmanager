import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cards = [];

  List<Map<String, dynamic>> get cards => _cards;

  void loadCards() {
    _cards = [
      {'id': 1, 'number': '**** **** **** 1234', 'expiry': '12/25'},
    ];
    notifyListeners();
  }

  void addCard(Map<String, dynamic> card) {
    _cards.add(card);
    notifyListeners();
  }
}
