
import 'package:banksamanager_app/screens/create_user_screen.dart';
import 'package:banksamanager_app/screens/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:banksamanager_app/screens/login_screen.dart';
import 'package:banksamanager_app/screens/home_screen.dart';

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
        title: 'Banks Manager',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        initialRoute: '/', // Sua rota inicial
        routes: {
          '/': (_) => LoginScreen(),
          '/home': (_) => const HomeScreen(),
          '/transactions': (_) => const TransactionsScreen(),
          '/loans': (_) => const LoansScreen(),
          '/cards': (_) => CardsScreen(),
          '/createUser': (context) => const CreateUserScreen(),
          '/userDetails': (context) {
            final args = ModalRoute.of(context)!.settings.arguments as num;
            return UserDetailsScreen(userId: args);
          }
        },
      );
    
  }
}