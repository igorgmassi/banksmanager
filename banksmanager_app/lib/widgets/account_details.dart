import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/account.dart';
import 'package:banksamanager_app/widgets/account_loans.dart';
import 'package:banksamanager_app/widgets/account_cards.dart';
import 'package:banksamanager_app/widgets/account_transactions.dart';

class AccountDetails extends StatelessWidget {
  final Account account;
  const AccountDetails({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ExpansionTile(
        leading: const Icon(Icons.account_balance_wallet_rounded, color: Colors.blueAccent),
        title: Text('Agência: ${account.agency} - Conta: ${account.accountnumber}',
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('Tipo: ${account.accounttype} | Saldo: R\$ ${account.balance.toStringAsFixed(2)}'),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          AccountLoans(accountId: account.id),
          const SizedBox(height: 8),
          AccountCards(accountId: account.id),
          const SizedBox(height: 8),
          AccountTransactions(accountId: account.id),
        ],
      ),
    );
  }
}