import 'package:banksamanager_app/models/user.dart';
import 'package:banksamanager_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:banksamanager_app/services/user_service.dart';
import 'package:http/src/response.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

    // Initialize the UserService
      List<User> users = await UserService.getUsers();
      print(users.length);
      
 
  


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
