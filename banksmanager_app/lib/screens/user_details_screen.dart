import 'package:banksamanager_app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/user.dart';
import 'package:banksamanager_app/models/account.dart';
import 'package:banksamanager_app/services/account_service.dart';
import 'package:banksamanager_app/widgets/add_transaction_dialog.dart';
import 'package:banksamanager_app/widgets/add_card_dialog.dart';
import 'package:banksamanager_app/widgets/add_loan_dialog.dart';
import 'package:banksamanager_app/widgets/user_info_section.dart';
import 'package:banksamanager_app/widgets/account_details.dart';
import 'package:banksamanager_app/widgets/home_header.dart';

class UserDetailsScreen extends StatefulWidget {
  final num userId;
  const UserDetailsScreen({super.key, required this.userId});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late Future<User> _userFuture;
  late Future<List<Account>> _accountsFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = UserService.getUser(widget.userId);
    _accountsFuture = AccountService.getAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: HomeHeader(
          onLogout: () {
            Navigator.pop(context);
          },
          title: 'Informações do Usuário',
        ),
      ),
      body: FutureBuilder<User>(
        future: _userFuture,
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (userSnapshot.hasError) {
            return Center(child: Text('Erro: ${userSnapshot.error}'));
          }
          final user = userSnapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                UserInfoSection(user: user),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.account_balance_wallet,
                            color: Color(0xFF1976D2),
                            size: 24,
                          ),
                          label: const Text(
                            'Conta',
                            style: TextStyle(
                              color: Color(0xFF1976D2),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            final result = await showDialog(
                              context: context,
                              builder:
                                  (_) => AddAccountDialog(userId: widget.userId),
                            );
                            if (result == true) {
                              if (!mounted) return;
                              setState(() {}); // Atualiza a tela
                            }
                          },
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.swap_horiz,
                            color: Color(0xFF1976D2),
                            size: 24,
                          ),
                          label: const Text(
                            'Transação',
                            style: TextStyle(
                              color: Color(0xFF1976D2),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            final accountId = await _selectAccountDialog(
                              context,
                              widget.userId,
                            );
                            if (accountId != null) {
                              if (!mounted) return;
                              final result = await showDialog(
                                context: context,
                                builder:
                                    (_) => AddTransactionDialog(
                                      accountId: accountId,
                                    ),
                              );
                              if (result == true) {
                                if (!mounted) return;
                                setState(() {});
                              }
                            }
                          },
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.credit_card,
                            color: Color(0xFF1976D2),
                            size: 24,
                          ),
                          label: const Text(
                            'Cartão',
                            style: TextStyle(
                              color: Color(0xFF1976D2),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            final accountId = await _selectAccountDialog(
                              context,
                              widget.userId,
                            );
                            if (accountId != null) {
                              if (!mounted) return;
                              final result = await showDialog(
                                context: context,
                                builder:
                                    (_) => AddCardDialog(accountId: accountId),
                              );
                              if (result == true) {
                                if (!mounted) return;
                                setState(() {});
                              }
                            }
                          },
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.attach_money,
                            color: Color(0xFF1976D2),
                            size: 24,
                          ),
                          label: const Text(
                            'Empréstimo',
                            style: TextStyle(
                              color: Color(0xFF1976D2),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            final accountId = await _selectAccountDialog(
                              context,
                              widget.userId,
                            );
                            if (accountId != null) {
                              if (!mounted) return;
                              final result = await showDialog(
                                context: context,
                                builder:
                                    (_) => AddLoanDialog(accountId: accountId),
                              );
                              if (result == true) {
                                if (!mounted) return;
                                setState(() {});
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Suas contas',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Divider(thickness: 1.2),
                FutureBuilder<List<Account>>(
                  future: _accountsFuture,
                  builder: (context, accountsSnapshot) {
                    if (accountsSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (accountsSnapshot.hasError) {
                      return Text('Erro: ${accountsSnapshot.error}');
                    }
                    final accounts =
                        accountsSnapshot.data!
                            .where((acc) => acc.user == user.id)
                            .toList();
                    if (accounts.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Nenhuma conta encontrada para este usuário.',
                        ),
                      );
                    }
                    return Column(
                      children:
                          accounts
                              .map(
                                (account) => AccountDetails(account: account),
                              )
                              .toList(),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Future<num?> _selectAccountDialog(BuildContext context, num userId) async {
  final accounts = await AccountService.getAccounts();
  final userAccounts = accounts.where((a) => a.user == userId).toList();
  if (userAccounts.isEmpty) return null;
  num? selected;
  await showDialog(
    context: context,
    builder:
        (ctx) => SimpleDialog(
          title: const Text('Selecione a conta'),
          children:
              userAccounts
                  .map(
                    (acc) => SimpleDialogOption(
                      onPressed: () {
                        selected = acc.id;
                        Navigator.pop(ctx);
                      },
                      child: Text('${acc.agency} - ${acc.accountnumber}'),
                    ),
                  )
                  .toList(),
        ),
  );
  return selected;
}

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
                validator:
                    (v) => v == null || v.isEmpty ? 'Informe a agência' : null,
                onSaved: (v) => _agency = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Número da Conta'),
                validator:
                    (v) => v == null || v.isEmpty ? 'Informe o número' : null,
                onSaved: (v) => _accountnumber = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tipo'),
                validator:
                    (v) => v == null || v.isEmpty ? 'Informe o tipo' : null,
                onSaved: (v) => _accounttype = v,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Saldo'),
                keyboardType: TextInputType.number,
                validator:
                    (v) =>
                        v == null || double.tryParse(v) == null
                            ? 'Saldo inválido'
                            : null,
                onSaved: (v) => _balance = double.tryParse(v ?? ''),
              ),
              if (_error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    _error!,
                    style: const TextStyle(color: Colors.red),
                  ),
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
          onPressed:
              _loading
                  ? null
                  : () async {
                    if (!_formKey.currentState!.validate()) return;
                    _formKey.currentState!.save();
                    setState(() => _loading = true);
                    try {
                      await AccountService.createAccount(
                        Account(
                          agency: _agency,
                          balance: _balance ?? 0.0,
                          accountnumber: _accountnumber!,
                          accounttype: _accounttype!,
                          user: widget.userId,
                        ),
                      );
                      if (mounted) Navigator.pop(context, true);
                    } catch (e) {
                      setState(() {
                        _error = 'Erro ao criar conta';
                        _loading = false;
                      });
                    }
                  },
          child:
              _loading
                  ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                  : const Text('Salvar'),
        ),
      ],
    );
  }
}
