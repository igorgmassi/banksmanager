import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/loan.dart';
import 'package:banksamanager_app/services/loan_service.dart';

class AccountLoans extends StatelessWidget {
  final num? accountId;
  const AccountLoans({super.key, required this.accountId});

  @override
  Widget build(BuildContext context) {
    if (accountId == null) return const SizedBox.shrink();
    return FutureBuilder<List<Loan>>(
      future: LoanService.getLoans(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        final loans = snapshot.data!.where((l) => l.account == accountId).toList();
        if (loans.isEmpty) return const ListTile(title: Text('Nenhum empréstimo.'));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.attach_money, color: Colors.green),
              title: Text('Empréstimos:', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ...loans.map((loan) => ListTile(
                  leading: const Icon(Icons.monetization_on_outlined, color: Colors.green),
                  title: Text('Valor: R\$ ${loan.amount?.toStringAsFixed(2) ?? ''}'),
                  subtitle: Text('Vencimento: ${loan.duedate?.toString().split(' ').first ?? ''} | Taxa: ${loan.interestrate ?? ''}%'),
                )),
          ],
        );
      },
    );
  }
}