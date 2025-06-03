import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/account.dart';
import 'package:banksamanager_app/services/account_service.dart';
import 'package:banksamanager_app/widgets/add_account_dialog.dart';

class AddAccountDialog extends StatefulWidget {
  final num userId;
  const AddAccountDialog({super.key, required this.userId});

  @override
  State<AddAccountDialog> createState() => _AddAccountDialogState();
}

class _AddAccountDialogState extends State<AddAccountDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _agency, _accountnumber, _accounttype;
  double? _balance;
  bool _loading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Conta'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Agência'),
                validator: (v) => v == null || v.isEmpty ? 'Informe a agência' : null,
                onSaved: (v) => _agency = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Número da Conta'),
                validator: (v) => v == null || v.isEmpty ? 'Informe o número' : null,
                onSaved: (v) => _accountnumber = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tipo'),
                validator: (v) => v == null || v.isEmpty ? 'Informe o tipo' : null,
                onSaved: (v) => _accounttype = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Saldo'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null || double.tryParse(v) == null ? 'Saldo inválido' : null,
                onSaved: (v) => _balance = double.tryParse(v ?? ''),
              ),
              if (_error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(_error!, style: const TextStyle(color: Colors.red)),
                ),
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
          onPressed: _loading
              ? null
              : () async {
                  if (!_formKey.currentState!.validate()) return;
                  _formKey.currentState!.save();
                  setState(() => _loading = true);
                  try {
                    await AccountService.createAccount(Account(
                      agency: _agency,
                      balance: _balance ?? 0.0,
                      accountnumber: _accountnumber!,
                      accounttype: _accounttype!,
                      user: widget.userId,
                    ));
                    if (mounted) Navigator.pop(context, true);
                  } catch (e) {
                    setState(() {
                      _error = 'Erro ao criar conta';
                      _loading = false;
                    });
                  }
                },
          child: _loading
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
              : const Text('Salvar'),
        ),
      ],
    );
  }
}