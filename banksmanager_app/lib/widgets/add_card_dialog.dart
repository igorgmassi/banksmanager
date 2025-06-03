import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/card.dart' as model;
import 'package:banksamanager_app/services/card_service.dart';
import 'package:banksamanager_app/services/account_service.dart';
import 'package:banksamanager_app/widgets/add_transaction_dialog.dart';

class AddCardDialog extends StatefulWidget {
  final num accountId;
  const AddCardDialog({super.key, required this.accountId});

  @override
  State<AddCardDialog> createState() => _AddCardDialogState();
}

class _AddCardDialogState extends State<AddCardDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _cvv, _cardnumber, _cardtype;
  DateTime? _expirationdate;
  bool _loading = false;
  String? _error;

  Future<num?> _selectAccountDialog(BuildContext context, num userId) async {
    final accounts = await AccountService.getAccounts();
    final userAccounts = accounts.where((a) => a.user == userId).toList();
    if (userAccounts.isEmpty) return null;
    num? selected;
    await showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Selecione a conta'),
        children: userAccounts.map((acc) => SimpleDialogOption(
          onPressed: () {
            selected = acc.id;
            Navigator.pop(ctx);
          },
          child: Text('${acc.agency} - ${acc.accountnumber}'),
        )).toList(),
      ),
    );
    return selected;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Cartão'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'CVV'),
                validator: (v) => v == null || v.length != 3 ? 'CVV inválido' : null,
                onSaved: (v) => _cvv = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Número do Cartão'),
                validator: (v) => v == null || v.length < 8 ? 'Número inválido' : null,
                onSaved: (v) => _cardnumber = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tipo'),
                validator: (v) => v == null || v.isEmpty ? 'Informe o tipo' : null,
                onSaved: (v) => _cardtype = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Data de Expiração (YYYY-MM-DD)'),
                validator: (v) => v == null || DateTime.tryParse(v) == null ? 'Data inválida' : null,
                onSaved: (v) => _expirationdate = DateTime.tryParse(v ?? ''),
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
                    await CardService.createCard(model.Card(
                      cvv: _cvv,
                      cardnumber: _cardnumber,
                      expirationdate: _expirationdate,
                      cardtype: _cardtype,
                      account: widget.accountId,
                    ));
                    if (mounted) Navigator.pop(context, true);
                  } catch (e) {
                    setState(() {
                      _error = 'Erro ao criar cartão';
                      _loading = false;
                    });
                  }
                },
          child: _loading
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
              : const Text('Salvar'),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.swap_horiz),
          label: const Text('Adicionar Transação'),
          onPressed: () async {
            final account = await AccountService.getAccount(widget.accountId);
            final accountId = await _selectAccountDialog(context, account.user);
            if (accountId != null) {
              final result = await showDialog(
                context: context,
                builder: (_) => AddTransactionDialog(accountId: accountId),
              );
              if (result == true) setState(() {});
            }
          },
        ),
      ],
    );
  }
}