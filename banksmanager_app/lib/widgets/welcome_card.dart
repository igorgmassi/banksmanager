import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.account_balance, size: 60, color: Color(0xFF1976D2)),
        const SizedBox(height: 16),
        const Text(
          'Boas vindas ao Banks Manager',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1976D2),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const Text(
          'Banks Manager é uma ferramenta desenvolvida para ajudá-lo a coletar e organizar todas as informações financeiras de sua família em um só lugar.',
          style: TextStyle(fontSize: 15, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        const Text(
          'Gerencie facilmente perfis de usuário e acompanhe os dados de cada membro com segurança e eficiência.',
          style: TextStyle(fontSize: 15, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
