import 'package:banksamanager_app/models/account.dart';
import 'package:banksamanager_app/models/loan.dart';
import 'package:banksamanager_app/models/transaction.dart';
import 'package:banksamanager_app/models/user.dart';
import 'package:banksamanager_app/models/card.dart' as CardModel;
import 'package:banksamanager_app/services/account_service.dart';
import 'package:banksamanager_app/services/card_service.dart';
import 'package:banksamanager_app/services/loan_service.dart';
import 'package:banksamanager_app/services/transaction_service.dart';


import 'package:flutter/material.dart';
import 'package:banksamanager_app/services/user_service.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

    // Initialize the UserService
    List<User> users = await UserService.getUsers();
    print(users.length);
    List<Loan> loans = await LoanService.getLoans();
    print(loans.length);
    List<Account> accounts = await AccountService.getAccounts();
    print(accounts.length);
    List<CardModel.Card> cards = await CardService.getCards();
    print(cards.length);
    List<Transaction> transactions = await TransactionService.getTransactions();
    print(transactions.length);
      
 
  


  // Run the app
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
