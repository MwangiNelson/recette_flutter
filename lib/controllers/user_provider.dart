import 'package:flutter/material.dart';
import 'package:recette_flutter/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User userData) {
    _user = userData;
    notifyListeners();
  }

  void signOut() {
    _user = null;
    notifyListeners();
  }
}
