import 'package:banksamanager_app/models/card.dart';
import 'package:banksamanager_app/services/api_service.dart';
import 'dart:convert' as convert;

class CardService {
  static Future<List<Card>> getCards() async {
    final response = await ApiService.get('cards');
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as List<dynamic>;
      return jsonData.map((json) => Card.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load cards');
    }
  }

  static Future<Card> getCard(num id) async {
    final response = await ApiService.get('cards/$id');
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as Map<String, dynamic>;
      return Card.fromJson(jsonData);
    } else {
      throw Exception('Failed to load card');
    }
  }

  static Future<Card> createCard(Card card) async {
    final response = await ApiService.post('cards', card.toJson());
    if (response.statusCode == 201) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as Map<String, dynamic>;
      return Card.fromJson(jsonData);
    } else {
      throw Exception('Failed to create card');
    }
  }

  static Future<void> deleteCard(num id) async {
    final response = await ApiService.delete('cards/$id');
    if (response.statusCode != 204) {
      throw Exception('Failed to delete card');
    }
  }
}