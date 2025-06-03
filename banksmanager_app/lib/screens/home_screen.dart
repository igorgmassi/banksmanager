import 'package:flutter/material.dart';
import 'package:banksamanager_app/widgets/home_header.dart';
import 'package:banksamanager_app/widgets/welcome_card.dart';
import 'package:banksamanager_app/widgets/user_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child:
        HomeHeader(
          onLogout: () {
            Navigator.pop(context);
          },
          title: 'Banks Manager - Início',
        ),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WelcomeCard(),
                  UserList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}