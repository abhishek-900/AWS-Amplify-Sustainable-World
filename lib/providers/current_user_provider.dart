import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/main.dart';

import 'package:sustainable_world/models/UserDetail.dart';

var currentUserProvider = Provider((ref) => CurrentUserProvider());

class CurrentUserProvider with ChangeNotifier {
  UserDetail? _currentUser;

  UserDetail? get currentUser => _currentUser;

  set currentUser(UserDetail? value) {
    mRole = value!.userType!;
    _currentUser = value;
    notifyListeners();
  }
}
