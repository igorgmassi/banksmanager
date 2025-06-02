import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banksamanager_app/providers/transaction_provider.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    transactionProvider.loadTransactions();

    return Scaffold(
      appBar: AppBar(title: Text('Transações')),
      body: ListView.builder(
        itemCount: transactionProvider.transactions.length,
        itemBuilder: (context, index) {
          final tx = transactionProvider.transactions[index];
          return ListTile(
            title: Text(tx['description']),
            subtitle: Text('Data: ${tx['date'].toString()}'),
            trailing: Text(
              'R\$${tx['amount'].toStringAsFixed(2)}',
              style: TextStyle(
                color: tx['amount'] < 0 ? Colors.red : Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }
}
