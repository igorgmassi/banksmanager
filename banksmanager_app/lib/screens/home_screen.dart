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
        child: HomeHeader(
          onLogout: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WelcomeCard(
                  onCreateUser: () async {
                    await Navigator.pushNamed(context, '/createUser');
                  },
                ),
                const SizedBox(height: 24),
                const UserList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
