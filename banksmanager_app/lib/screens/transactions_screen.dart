import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banksamanager_app/providers/transaction_provider.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Transações')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tela de Transações'),
            const SizedBox(height: 20),
            ...transactionProvider.transactions.map((transaction) => Text(transaction)).toList(),
            ElevatedButton(
              onPressed: () {
                transactionProvider.addTransaction('Nova Transação ${transactionProvider.transactions.length + 1}');
              },
              child: const Text('Adicionar Transação'),
            ),
          ],
        ),
      ),
    );
  }
}