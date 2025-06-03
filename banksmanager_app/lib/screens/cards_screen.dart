import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banksamanager_app/providers/card_provider.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cartões')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tela de Cartões'),
            const SizedBox(height: 20),
            ...cardProvider.cards.map((card) => Text(card)).toList(),
            ElevatedButton(
              onPressed: () {
                cardProvider.addCard('Novo Cartão ${cardProvider.cards.length + 1}');
              },
              child: const Text('Adicionar Cartão'),
            ),
          ],
        ),
      ),
    );
  }
}