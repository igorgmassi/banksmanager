import 'package:flutter/material.dart';
import 'package:banksamanager_app/models/user.dart';
import 'package:banksamanager_app/models/account.dart';
import 'package:banksamanager_app/models/loan.dart';
import 'package:banksamanager_app/models/card.dart' as model_card;
import 'package:banksamanager_app/models/transaction.dart';
import 'package:banksamanager_app/services/user_service.dart';
import 'package:banksamanager_app/services/account_service.dart';
import 'package:banksamanager_app/services/loan_service.dart';
import 'package:banksamanager_app/services/card_service.dart';
import 'package:banksamanager_app/services/transaction_service.dart';
import 'package:banksamanager_app/widgets/add_account_dialog.dart';

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
      appBar: AppBar(
        title: const Text('Detalhes do Usuário'),
        centerTitle: true,
        elevation: 2,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.account_balance_wallet),
                      label: const Text('Conta'),
                      onPressed: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (_) => AddAccountDialog(userId: widget.userId),
                        );
                        if (result == true) setState(() {}); // Atualiza a tela
                      },
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.swap_horiz),
                      label: const Text('Transação'),
                      onPressed: () async {
                        // Implemente showDialog para AddTransactionDialog
                      },
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.credit_card),
                      label: const Text('Cartão'),
                      onPressed: () async {
                        // Implemente showDialog para AddCardDialog
                      },
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.attach_money),
                      label: const Text('Empréstimo'),
                      onPressed: () async {
                        // Implemente showDialog para AddLoanDialog
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _UserInfoSection(user: user),
                const SizedBox(height: 32),
                Text('Contas', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                const Divider(thickness: 1.2),
                FutureBuilder<List<Account>>(
                  future: _accountsFuture,
                  builder: (context, accountsSnapshot) {
                    if (accountsSnapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (accountsSnapshot.hasError) {
                      return Text('Erro: ${accountsSnapshot.error}');
                    }
                    final accounts = accountsSnapshot.data!
                        .where((acc) => acc.user == user.id)
                        .toList();
                    if (accounts.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text('Nenhuma conta encontrada para este usuário.'),
                      );
                    }
                    return Column(
                      children: accounts.map((account) => _AccountDetails(account: account)).toList(),
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

class _UserInfoSection extends StatelessWidget {
  final User user;
  const _UserInfoSection({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                user.name != null && user.name!.isNotEmpty ? user.name![0].toUpperCase() : '?',
                style: const TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name ?? '', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.email, size: 18, color: Colors.grey),
                      const SizedBox(width: 6),
                      Flexible(child: Text(user.email ?? '', style: const TextStyle(fontSize: 15))),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.badge, size: 18, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text('CPF: ${user.cpf ?? ''}', style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountDetails extends StatelessWidget {
  final Account account;
  const _AccountDetails({required this.account});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ExpansionTile(
        leading: const Icon(Icons.account_balance_wallet_rounded, color: Colors.blueAccent),
        title: Text('Agência: ${account.agency} - Conta: ${account.accountnumber}',
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('Tipo: ${account.accounttype} | Saldo: R\$ ${account.balance.toStringAsFixed(2)}'),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _AccountLoans(accountId: account.id),
          const SizedBox(height: 8),
          _AccountCards(accountId: account.id),
          const SizedBox(height: 8),
          _AccountTransactions(accountId: account.id),
        ],
      ),
    );
  }
}

class _AccountLoans extends StatelessWidget {
  final num? accountId;
  const _AccountLoans({required this.accountId});

  @override
  Widget build(BuildContext context) {
    if (accountId == null) return const SizedBox.shrink();
    return FutureBuilder<List<Loan>>(
      future: LoanService.getLoans(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        final loans = snapshot.data!.where((l) => l.account == accountId).toList();
        if (loans.isEmpty) return const ListTile(title: Text('Nenhum empréstimo.'));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.attach_money, color: Colors.green),
              title: Text('Empréstimos:', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ...loans.map((loan) => ListTile(
                  leading: const Icon(Icons.monetization_on_outlined, color: Colors.green),
                  title: Text('Valor: R\$ ${loan.amount?.toStringAsFixed(2) ?? ''}'),
                  subtitle: Text('Vencimento: ${loan.duedate?.toString().split(' ').first ?? ''} | Taxa: ${loan.interestrate ?? ''}%'),
                )),
          ],
        );
      },
    );
  }
}

class _AccountCards extends StatelessWidget {
  final num? accountId;
  const _AccountCards({required this.accountId});

  @override
  Widget build(BuildContext context) {
    if (accountId == null) return const SizedBox.shrink();
    return FutureBuilder<List<model_card.Card>>(
      future: CardService.getCards(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        final cards = snapshot.data!.where((c) => c.account == accountId).toList();
        if (cards.isEmpty) return const ListTile(title: Text('Nenhum cartão.'));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.credit_card, color: Colors.deepPurple),
              title: Text('Cartões:', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ...cards.map((card) => ListTile(
                  leading: const Icon(Icons.credit_card_outlined, color: Colors.deepPurple),
                  title: Text('Número: ${card.cardnumber ?? ''}'),
                  subtitle: Text('Tipo: ${card.cardtype ?? ''} | Expira: ${card.expirationdate?.toString().split(' ').first ?? ''}'),
                )),
          ],
        );
      },
    );
  }
}

class _AccountTransactions extends StatelessWidget {
  final num? accountId;
  const _AccountTransactions({required this.accountId});

  @override
  Widget build(BuildContext context) {
    if (accountId == null) return const SizedBox.shrink();
    return FutureBuilder<List<Transaction>>(
      future: TransactionService.getTransactions(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        final transactions = snapshot.data!.where((t) => t.account == accountId).toList();
        if (transactions.isEmpty) return const ListTile(title: Text('Nenhuma transação.'));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(Icons.swap_horiz, color: Colors.orange),
              title: Text('Transações:', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ...transactions.map((tx) => ListTile(
                  leading: Icon(
                    tx.transactiontype?.toLowerCase() == 'entrada'
                        ? Icons.arrow_downward
                        : Icons.arrow_upward,
                    color: tx.transactiontype?.toLowerCase() == 'entrada' ? Colors.green : Colors.red,
                  ),
                  title: Text('${tx.transactiontype ?? ''} - R\$ ${tx.amount?.toStringAsFixed(2) ?? ''}'),
                  subtitle: Text('Data: ${tx.transactiondate?.toString().split(' ').first ?? ''}\n${tx.description ?? ''}'),
                )),
          ],
        );
      },
    );
  }
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