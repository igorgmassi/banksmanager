import 'package:flutter/material.dart';
import 'package:banksamanager_app/services/auth_service.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {


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
                try {
                  final result = await AuthService.login(
                    usernameController.text,
                    passwordController.text,
                  );
                  
                  Navigator.pushReplacementNamed(context, '/home');
                } catch (e) {
  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
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
