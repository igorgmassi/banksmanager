import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banksamanager_app/providers/account_provider.dart';
import 'package:intl/intl.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  String _getUserNameById(num id) {
    // Simula nomes dos usuários com base no ID
    switch (id) {
      case 1:
        return 'Adrian Tenis Malavasi';
      case 2:
        return 'Luiz Felipe Foeger';
      case 3:
        return 'Igor Gonçalves Massi';
      default:
        return 'Desconhecido';
    }
  }

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);
    final currencyFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contas Cadastradas'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: accountProvider.accounts.length,
        itemBuilder: (context, index) {
          final account = accountProvider.accounts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 3,
            child: ListTile(
              title: Text(
                'Banco: ${_getAgencyName(account.id)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Saldo: ${currencyFormat.format(account.balance)}'),
                  Text('Número da Conta: ${account.accountnumber}'),
                  Text('Tipo: ${account.accounttype}'),
                  Text('Usuário: ${_getUserNameById(account.user)}'),
                ],
              ),
              trailing: Text('#${account.id}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }

  String _getAgencyName(num id) {
    // Apenas simulação com base no ID da conta
    switch (id) {
      case 7:
      case 1:
        return 'Banco do Brasil';
      case 6:
        return 'Itaú';
      case 5:
      case 4:
        return 'Bradesco';
      case 3:
        return 'Sicoob';
      case 2:
        return 'Nubank';
      default:
        return 'Desconhecido';
    }
  }
}
