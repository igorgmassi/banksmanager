import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/user.dart';
import 'package:banksamanager_app/services/user_service.dart';

class EditUserDialog extends StatefulWidget {
  final User user;
  const EditUserDialog({super.key, required this.user});

  @override
  State<EditUserDialog> createState() => _EditUserDialogState();
}

class _EditUserDialogState extends State<EditUserDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _email, _cpf, _password;
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _name = widget.user.name ?? '';
    _email = widget.user.email ?? '';
    _cpf = widget.user.cpf ?? '';
    _password = widget.user.password ?? '';
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final updatedUser = User(
        id: widget.user.id,
        name: _name,
        email: _email,
        cpf: _cpf,
        password: _password,
      );
      await UserService.updateUser(widget.user.id!, updatedUser);
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      setState(() {
        _error = 'Erro ao atualizar usuário: ${e.toString()}';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Editar Usuário'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (v) => v == null || v.trim().isEmpty ? 'Informe o nome' : null,
                onSaved: (v) => _name = v!.trim(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) => v == null || !v.contains('@') ? 'Email inválido' : null,
                onSaved: (v) => _email = v!.trim(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _cpf,
                decoration: const InputDecoration(labelText: 'CPF'),
                validator: (v) => v == null || v.length < 11 ? 'CPF inválido' : null,
                onSaved: (v) => _cpf = v!.trim(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _password,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (v) => v == null || v.length < 6 ? 'Senha muito curta' : null,
                onSaved: (v) => _password = v!,
              ),
              const SizedBox(height: 24),
              if (_error != null)
                Text(_error!, style: const TextStyle(color: Colors.red)),
              if (_loading)
                const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _loading ? null : () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _loading ? null : _submit,
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}