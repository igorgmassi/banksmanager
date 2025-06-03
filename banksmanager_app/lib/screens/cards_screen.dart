import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banksamanager_app/providers/card_provider.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final cardProvider = Provider.of<CardProvider>(context);
    cardProvider.loadCards();

    return Scaffold(
      appBar: AppBar(title: Text('Cartões')),
      body: ListView.builder(
        itemCount: cardProvider.cards.length,
        itemBuilder: (context, index) {
          final card = cardProvider.cards[index];
          return ListTile(
            title: Text(card['number']),
            subtitle: Text('Validade: ${card['expiry']}'),
          );
        },
      ),
    );
  }
}
