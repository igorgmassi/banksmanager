import 'package:banksamanager_app/models/user.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:banksamanager_app/services/user_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Example usage of UserService
  try {
    List<User> users = await UserService.getUsers();
    developer.log('Users fetched successfully: ${users.length}');
  } catch (e) {
    developer.log('Error fetching users: $e');
  }

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
