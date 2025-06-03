import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/user.dart';
import 'package:banksamanager_app/services/user_service.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _cpf;
  String? _password;
  bool _loading = false;
  String? _error;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final user = User(
        name: _name,
        email: _email,
        cpf: _cpf,
        password: _password,
      );
      print('Cheguei aqui: $user');
      await UserService.createUser(user);
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      setState(() {
        _error = 'Erro ao criar usuário: ${e.toString()}';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (v) => v == null || v.trim().isEmpty ? 'Informe o nome' : null,
              onSaved: (v) => _name = v?.trim(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (v) => v == null || !v.contains('@') ? 'Email inválido' : null,
              onSaved: (v) => _email = v?.trim(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'CPF'),
              validator: (v) => v == null || v.length < 11 ? 'CPF inválido' : null,
              onSaved: (v) => _cpf = v?.trim(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
              validator: (v) => v == null || v.length < 6 ? 'Senha muito curta' : null,
              onSaved: (v) => _password = v,
            ),
            const SizedBox(height: 24),
            if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red)),
            if (_loading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Salvar'),
              ),
          ],
        ),
      ),
    );
  }
}