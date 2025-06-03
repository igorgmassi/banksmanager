import 'package:banksamanager_app/models/account.dart';
import 'package:banksamanager_app/services/account_service.dart';
import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contas')),
      body: FutureBuilder<List<Account>>(
        future: AccountService.getAccounts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar contas: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhuma conta encontrada.'));
          } else {
            final accounts = snapshot.data!;
            return ListView.builder(
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                final account = accounts[index];
                return ListTile(
                  title: Text(account.accountnumber),
                  subtitle: Text(
                    'Saldo: R\$${account.balance.toStringAsFixed(2)}',
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
