import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banksamanager_app/providers/account_provider.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Contas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tela de Contas'),
            const SizedBox(height: 20),
            ...accountProvider.accounts.map((account) => Text(account)).toList(),
            ElevatedButton(
              onPressed: () {
                accountProvider.addAccount('Nova Conta ${accountProvider.accounts.length + 1}');
              },
              child: const Text('Adicionar Conta'),
            ),
          ],
        ),
      ),
    );
  }
}