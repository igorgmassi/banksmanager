import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/transaction.dart';
import 'package:banksamanager_app/services/transaction_service.dart';

class AddTransactionDialog extends StatefulWidget {
  final num accountId;
  const AddTransactionDialog({super.key, required this.accountId});

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final _formKey = GlobalKey<FormState>();
  double? _amount;
  String? _type;
  String? _description;
  bool _loading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Transação'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null || double.tryParse(v) == null ? 'Valor inválido' : null,
                onSaved: (v) => _amount = double.tryParse(v ?? ''),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Tipo'),
                items: const [
                  DropdownMenuItem(value: 'entrada', child: Text('Entrada')),
                  DropdownMenuItem(value: 'saida', child: Text('Saída')),
                ],
                validator: (v) => v == null ? 'Selecione o tipo' : null,
                onChanged: (v) => _type = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                onSaved: (v) => _description = v,
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
                    await TransactionService.createTransaction(Transaction(
                      amount: _amount,
                      transactiontype: _type,
                      description: _description,
                      account: widget.accountId,
                    ));
                    if (mounted) Navigator.pop(context, true);
                  } catch (e) {
                    setState(() {
                      _error = 'Erro ao criar transação';
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