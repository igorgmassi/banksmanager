import 'package:flutter/material.dart';
import 'package:banksamanager_app/routes/app_routes.dart';


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
        routes: appRoutes,
      );
    
  }
}