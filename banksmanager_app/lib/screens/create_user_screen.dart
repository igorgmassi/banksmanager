import 'package:flutter/material.dart';
import 'package:banksamanager_app/widgets/user_form.dart';


class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Usuário')),
      body: const Center(
        child: Card(
          margin: EdgeInsets.all(24),
          child: UserForm(),
        ),
      ),
    );
  }
}
