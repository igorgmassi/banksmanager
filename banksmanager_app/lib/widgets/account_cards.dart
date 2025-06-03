import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/card.dart' as model_card;
import 'package:banksamanager_app/services/card_service.dart';

class AccountCards extends StatelessWidget {
  final num? accountId;
  const AccountCards({super.key, required this.accountId});

  @override
  Widget build(BuildContext context) {
    if (accountId == null) return const SizedBox.shrink();
    return FutureBuilder<List<model_card.Card>>(
      future: CardService.getCards(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        final cards = snapshot.data!.where((c) => c.account == accountId).toList();
        if (cards.isEmpty) return const ListTile(title: Text('Nenhum cartão.'));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              // leading: Icon(Icons.credit_card, color: Colors.deepPurple),
              title: Text('Cartões:', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ...cards.map((card) => ListTile(
                  leading: const Icon(Icons.credit_card_outlined, color: Colors.deepPurple),
                  title: Text('Número: ${card.cardnumber ?? ''}'),
                  subtitle: Text('Tipo: ${card.cardtype ?? ''} | Expira: ${card.expirationdate?.toString().split(' ').first ?? ''}'),
                )),
          ],
        );
      },
    );
  }
}