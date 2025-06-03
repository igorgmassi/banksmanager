import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banksamanager_app/providers/loan_provider.dart';

class LoansScreen extends StatelessWidget {
  const LoansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loanProvider = Provider.of<LoanProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Empréstimos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tela de Empréstimos'),
            const SizedBox(height: 20),
            ...loanProvider.loans.map((loan) => Text(loan)).toList(),
            ElevatedButton(
              onPressed: () {
                loanProvider.addLoan('Novo Empréstimo ${loanProvider.loans.length + 1}');
              },
              child: const Text('Adicionar Empréstimo'),
            ),
          ],
        ),
      ),
    );
  }
}