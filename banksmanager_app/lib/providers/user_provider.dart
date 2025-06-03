import 'package:banksamanager_app/models/user.dart';
import 'package:banksamanager_app/services/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final List<User>? _user = [];

  List<User>? get user => _user;

  void loadUser() async {
    try {
      List<User> fetchedUser = await UserService.getUsers();
      _user?.clear();
      _user?.addAll(fetchedUser);
      notifyListeners();
    } catch (error) {
      print('Error loading user: $error');
    }
  }

   void deleteUser(num id) {
    UserService.deleteUser(id).then((_) {
      _user?.removeWhere((user) => user.id == id);
      notifyListeners();
    }).catchError((error) {
      print('Error deleting user: $error');
    });
  }
  
}

 
