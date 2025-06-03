import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banksamanager_app/providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Usuário'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await auth.login(usernameController.text, passwordController.text);
                if (auth.isAuthenticated) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
