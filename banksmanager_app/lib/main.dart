import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banksamanager_app/providers/auth_provider.dart';
import 'package:banksamanager_app/providers/account_provider.dart';
import 'package:banksamanager_app/providers/transaction_provider.dart';
import 'package:banksamanager_app/providers/loan_provider.dart';
import 'package:banksamanager_app/providers/card_provider.dart';

import 'package:banksamanager_app/screens/login_screen.dart';
import 'package:banksamanager_app/screens/home_screen.dart';
import 'package:banksamanager_app/screens/accounts_screen.dart';
import 'package:banksamanager_app/screens/transactions_screen.dart';
import 'package:banksamanager_app/screens/loans_screen.dart';
import 'package:banksamanager_app/screens/cards_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => LoanProvider()),
        ChangeNotifierProvider(create: (_) => CardProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bank Manager',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        initialRoute: '/', // Sua rota inicial
        routes: {
          '/': (_) => LoginScreen(),
          '/home': (_) => const HomeScreen(),
          '/accounts': (_) => const AccountsScreen(),
          '/transactions': (_) => const TransactionsScreen(),
          '/loans': (_) => const LoansScreen(),
          '/cards': (_) => const CardsScreen(),
        },
      ),
    );
  }
}