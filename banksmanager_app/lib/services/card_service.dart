import 'package:banksamanager_app/models/card.dart';
import 'package:banksamanager_app/services/api_service.dart';

class CardService {
  static Future<List<Card>> getCards() async {
    final response = await ApiService.get('cards');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.body as List;
      return data.map((json) => Card.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cards');
    }
  }

  static Future<Card> getCard(String id) async {
    final response = await ApiService.get('cards/$id');

    if (response.statusCode == 200) {
      return Card.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load card');
    }
  }

  static Future<Card> createCard(Card card) async {
    final response = await ApiService.post('cards', card.toJson());

    if (response.statusCode == 201) {
      return Card.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create card');
    }
  }

  static Future<void> deleteCard(String id) async {
    final response = await ApiService.delete('cards/$id');

    if (response.statusCode != 204) {
      throw Exception('Failed to delete card');
    }
  }
}