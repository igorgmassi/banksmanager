import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Cartões')),
      body: Scaffold(
        body: Center(
          child: Text('Tela de Transações'),
        ),
      ),
    );
  }
}
