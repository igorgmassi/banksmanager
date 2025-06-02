import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banksamanager_app/providers/loan_provider.dart';

class LoansScreen extends StatelessWidget {
  const LoansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loanProvider = Provider.of<LoanProvider>(context);
    loanProvider.loadLoans();

    return Scaffold(
      appBar: AppBar(title: Text('Empréstimos')),
      body: ListView.builder(
        itemCount: loanProvider.loans.length,
        itemBuilder: (context, index) {
          final loan = loanProvider.loans[index];
          return ListTile(
            title: Text('Empréstimo de R\$${loan['amount'].toStringAsFixed(2)}'),
            subtitle: Text('Vencimento: ${loan['dueDate'].toString().split(' ')[0]}'),
          );
        },
      ),
    );
  }
}
