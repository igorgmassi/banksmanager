import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/card.dart' as model_card; 

class CardProvider extends ChangeNotifier {
  List<model_card.BankCard> _cards = []; 
  bool _isLoading = false;
  String? _errorMessage;

  List<model_card.BankCard> get cards => _cards;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCards() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));

      final List<Map<String, dynamic>> apiResponse = [
        {"id": 9, "cvv": "947", "cardnumber": "401273720001", "expirationdate": "2040-02-09T00:00:00.000Z", "cardtype": "Débito", "account": 751829387},
        {"id": 8, "cvv": "664", "cardnumber": "548655884233", "expirationdate": "2029-08-02T00:00:00.000Z", "cardtype": "Crédito", "account": 732619284},
        {"id": 7, "cvv": "236", "cardnumber": "264165351321", "expirationdate": "2039-11-02T00:00:00.000Z", "cardtype": "Crédito", "account": 732619284},
        {"id": 6, "cvv": "566", "cardnumber": "545364568652", "expirationdate": "2035-05-09T00:00:00.000Z", "cardtype": "Crédito", "account": 321947213},
        {"id": 5, "cvv": "892", "cardnumber": "586135158656", "expirationdate": "2037-09-18T00:00:00.000Z", "cardtype": "Débito", "account": 174291723},
        {"id": 4, "cvv": "921", "cardnumber": "603239210842", "expirationdate": "2026-06-16T00:00:00.000Z", "cardtype": "Crédito", "account": 987654321},
        {"id": 3, "cvv": "048", "cardnumber": "491273812638", "expirationdate": "2027-05-18T00:00:00.000Z", "cardtype": "Débito", "account": 582673548},
        {"id": 2, "cvv": "893", "cardnumber": "04128371847", "expirationdate": "2030-11-20T00:00:00.000Z", "cardtype": "Crédito", "account": 987654321},
        {"id": 1, "cvv": "837", "cardnumber": "173281471893", "expirationdate": "2028-05-29T00:00:00.000Z", "cardtype": "Débito", "account": 123456789},
      ];

      _cards = apiResponse.map((json) => model_card.BankCard.fromJson(json)).toList(); 

    } catch (e) {
      _errorMessage = 'Failed to load cards: $e';
      _cards = []; // Clear cards on error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}