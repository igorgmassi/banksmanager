import 'package:flutter/material.dart';
import 'package:banksamanager_app/services/user_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Banks Manager',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: UserService.getUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      final users = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: users?.length,
                        itemBuilder: (context, index) {
                          final user = users?[index];
                          return ListTile(
                            title: Text(user!.name),
                            subtitle: Text('Email: ${user.email}'),
                          );
                        },
                      );
                    } else {
                      return Text('No users found');
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
