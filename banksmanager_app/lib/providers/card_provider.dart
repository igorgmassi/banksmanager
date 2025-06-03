import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  // Example state or data
  List<String> _cards = ['Cartão de Crédito Visa', 'Cartão de Débito'];

  List<String> get cards => _cards;

  void addCard(String cardDetail) {
    _cards.add(cardDetail);
    notifyListeners();
  }
  // Add methods for managing cards (block, unblock, details)
}