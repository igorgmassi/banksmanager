import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banksamanager_app/providers/account_provider.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);
    accountProvider.loadAccounts();

    return Scaffold(
      appBar: AppBar(title: Text('Contas')),
      body: ListView.builder(
        itemCount: accountProvider.accounts.length,
        itemBuilder: (context, index) {
          final account = accountProvider.accounts[index];
          return ListTile(
            title: Text(account['name']),
            subtitle: Text('Saldo: R\$${account['balance'].toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
