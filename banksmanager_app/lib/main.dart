import 'package:banksamanager_app/models/account.dart';
import 'package:banksamanager_app/models/loan.dart';
import 'package:banksamanager_app/models/transaction.dart';
import 'package:banksamanager_app/models/user.dart';
import 'package:banksamanager_app/models/card.dart' as CardModel;
import 'package:banksamanager_app/services/account_service.dart';
import 'package:banksamanager_app/services/card_service.dart';
import 'package:banksamanager_app/services/loan_service.dart';
import 'package:banksamanager_app/services/transaction_service.dart';
import 'package:banksamanager_app/services/user_service.dart';

import 'package:flutter/material.dart';
import 'package:banksamanager_app/screens/login_screen.dart';
import 'package:banksamanager_app/screens/home_screen.dart';
import 'package:banksamanager_app/screens/accounts_screen.dart';
import 'package:banksamanager_app/screens/transactions_screen.dart';
import 'package:banksamanager_app/screens/loans_screen.dart';
import 'package:banksamanager_app/screens/cards_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  // Run the app
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          '/cards': (_) => CardsScreen(),
        },
      );
    
  }
}