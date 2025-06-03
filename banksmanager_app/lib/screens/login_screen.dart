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
      body: Stack(
        children: [
          // Background color/gradient
          Container(
            color: const Color(0xFF4C6FFF), // A shade of blue similar to the image
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Bank Manager Logo
                  Image.asset(
                    'assets/bank_manager_logo.png', // Ensure this path is correct and asset is declared
                    height: 100,
                  ),
                  const SizedBox(height: 50),
                  // Usuário Text Field
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Usuário',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Senha Text Field
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                      obscureText: true,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Login Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await auth.login(usernameController.text, passwordController.text);
                            if (auth.isAuthenticated) {
                              // After successful login, navigate to the MainScreen
                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Credenciais inválidas')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3B5BCC), // Darker blue for button
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Expanded(
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       // Implement SSO login logic
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(content: Text('SSO Login not implemented')),
                      //         );
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: const Color(0xFF3B5BCC), // Darker blue for button
                      //       foregroundColor: Colors.white,
                      //       padding: const EdgeInsets.symmetric(vertical: 15),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(8),
                      //       ),
                      //     ),
                      //     child: const Text(
                      //       'Login via SSO',
                      //       style: TextStyle(fontSize: 16),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Recuperar Acesso
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Recuperar Acesso not implemented')),
                              );
                    },
                    child: const Text(
                      'Recuperar Acesso',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Precisa de Ajuda
                  Column(
                    children: [
                      const Icon(Icons.help_outline, color: Colors.white, size: 30),
                      const SizedBox(height: 5),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Ajuda not implemented')),
                              );
                        },
                        child: const Text(
                          'PRECISA DE AJUDA',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}