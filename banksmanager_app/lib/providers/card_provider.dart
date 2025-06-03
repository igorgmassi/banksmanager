import 'package:flutter/material.dart';
import 'package:banksamanager_app/services/card_service.dart';
import 'package:banksamanager_app/models/card.dart' as card_model;


class CardProvider with ChangeNotifier {
  List<card_model.Card> _cards = [];

  List<card_model.Card> get cards => _cards;

  void loadCards() {
    try {
      CardService.getCards().then((fetchedCards) {
        _cards = fetchedCards;
        notifyListeners();
      }).catchError((error) {
        print('Error loading cards: $error');
      });
    } catch (error) {
      print('Error in loadCards: $error');
    }

  }

  void addCard(card_model.Card card) {
    CardService.createCard(card).then((createdCard) {
      _cards.add(createdCard);
      notifyListeners();
    }).catchError((error) {
      print('Error adding card: $error');
    });
    notifyListeners();
  }

  void deleteCard(num id) {
    CardService.deleteCard(id).then((_) {
      _cards.removeWhere((card) => card.id == id);
      notifyListeners();
    }).catchError((error) {
      print('Error deleting card: $error');
    });
  }
}
