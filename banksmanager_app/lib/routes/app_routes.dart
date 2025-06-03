import 'package:flutter/material.dart';
import 'package:banksamanager_app/screens/login_screen.dart';
import 'package:banksamanager_app/screens/home_screen.dart';
import 'package:banksamanager_app/screens/create_user_screen.dart';
import 'package:banksamanager_app/screens/user_details_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginScreen(
        onCreateUser: () {
          Navigator.pushNamed(context, '/registrar');
        },
      ),
  '/home': (_) => const HomeScreen(),
  '/registrar': (context) => const CreateUserScreen(),
  '/detalhes/usuario': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as num;
    return UserDetailsScreen(userId: args);
  }
};