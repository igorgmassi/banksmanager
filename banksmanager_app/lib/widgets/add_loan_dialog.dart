import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/loan.dart';
import 'package:banksamanager_app/services/loan_service.dart';

class AddLoanDialog extends StatefulWidget {
  final num accountId;
  const AddLoanDialog({super.key, required this.accountId});

  @override
  State<AddLoanDialog> createState() => _AddLoanDialogState();
}

class _AddLoanDialogState extends State<AddLoanDialog> {
  final _formKey = GlobalKey<FormState>();
  double? _amount;
  double? _interestrate;
  DateTime? _duedate;
  bool _loading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Empréstimo'),
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
              TextFormField(
                decoration: const InputDecoration(labelText: 'Taxa de Juros (%)'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null || double.tryParse(v) == null ? 'Taxa inválida' : null,
                onSaved: (v) => _interestrate = double.tryParse(v ?? ''),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Data de Vencimento (YYYY-MM-DD)'),
                validator: (v) => v == null || DateTime.tryParse(v) == null ? 'Data inválida' : null,
                onSaved: (v) => _duedate = DateTime.tryParse(v ?? ''),
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
                    await LoanService.createLoan(Loan(
                      amount: _amount,
                      interestrate: _interestrate,
                      duedate: _duedate,
                      account: widget.accountId,
                    ));
                    if (mounted) Navigator.pop(context, true);
                  } catch (e) {
                    setState(() {
                      _error = 'Erro ao criar empréstimo';
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