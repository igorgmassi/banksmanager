import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  final VoidCallback onCreateUser;
  const WelcomeCard({super.key, required this.onCreateUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.account_balance, size: 60, color: Colors.blueAccent),
        const SizedBox(height: 16),
        const Text(
          'Welcome to Banks Manager',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const Text(
          'Banks Manager is a tool designed to help you collect and organize all your family\'s financial information in one place. '
          'Easily manage user profiles and keep track of each member\'s data securely and efficiently.',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          icon: const Icon(Icons.person_add),
          label: const Text('Create New User'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onCreateUser,
        ),
      ],
    );
  }
}