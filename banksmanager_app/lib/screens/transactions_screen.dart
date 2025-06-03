import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Transações')),
      body: Scaffold(
        body: Center(
          child: Text('Tela de Transações'),
        ),
      ),
    );
  }
}
