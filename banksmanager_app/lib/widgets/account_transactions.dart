import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/transaction.dart';
import 'package:banksamanager_app/services/transaction_service.dart';

class AccountTransactions extends StatelessWidget {
  final num? accountId;
  const AccountTransactions({super.key, required this.accountId});

  @override
  Widget build(BuildContext context) {
    if (accountId == null) return const SizedBox.shrink();
    return FutureBuilder<List<Transaction>>(
      future: TransactionService.getTransactions(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        final transactions = snapshot.data!.where((t) => t.account == accountId).toList();
        if (transactions.isEmpty) return const ListTile(title: Text('Nenhuma transação.'));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.swap_horiz, color: Colors.orange),
              title: Text('Transações:', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ...transactions.map((tx) => ListTile(
                  leading: Icon(
                    tx.transactiontype?.toLowerCase() == 'entrada'
                        ? Icons.arrow_downward
                        : Icons.arrow_upward,
                    color: tx.transactiontype?.toLowerCase() == 'entrada' ? Colors.green : Colors.red,
                  ),
                  title: Text('${tx.transactiontype ?? ''} - R\$ ${tx.amount?.toStringAsFixed(2) ?? ''}'),
                  subtitle: Text('Data: ${tx.transactiondate?.toString().split(' ').first ?? ''}\n${tx.description ?? ''}'),
                )),
          ],
        );
      },
    );
  }
}