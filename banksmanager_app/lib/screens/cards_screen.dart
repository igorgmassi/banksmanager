import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banksamanager_app/providers/card_provider.dart';
import 'package:banksamanager_app/models/card.dart' as model; // Importa a classe BankCard

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CardProvider>(context, listen: false).fetchCards();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C6FFF),
        title: const Text(
          'Meus Cartões',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: const Color(0xFFF0F2F5),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF4C6FFF),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(),
                  SizedBox(height: 10),
                  Text(
                    'Selecione um Cartão:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: cardProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : cardProvider.errorMessage != null
                      ? Center(
                          child: Text(
                            'Error: ${cardProvider.errorMessage}',
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                      : cardProvider.cards.isEmpty
                          ? const Center(child: Text('Nenhum cartão encontrado.'))
                          : ListView.builder(
                              padding: const EdgeInsets.all(16.0),
                              itemCount: cardProvider.cards.length,
                              itemBuilder: (context, index) {
                                final card = cardProvider.cards[index];
                                return _buildCardItem(card);
                              },
                            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem(model.BankCard card) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cartão ${card.cardNumber} selecionado!')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    card.cardType == 'Crédito' ? 'Crédito' : 'Débito',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF4C6FFF),
                    ),
                  ),
                  Text(
                    'CVV: ${card.cvv}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _formatCardNumber(card.cardNumber),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Válido até: ${_formatExpirationDate(card.expirationDate)}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Conta: ${card.account}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'ID: ${card.id}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatCardNumber(String cardNumber) {
    if (cardNumber.length < 4) return cardNumber;
    String lastFour = cardNumber.substring(cardNumber.length - 4);
    return '**** **** **** $lastFour';
  }

  String _formatExpirationDate(DateTime date) {
    final monthNames = [
      '', 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
      'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
    ];
    return '${monthNames[date.month]} de ${date.year}';
  }
}