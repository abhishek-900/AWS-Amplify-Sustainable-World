// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sustainable_world/data/models/user_details.dart';
// import 'package:sustainable_world/data/models/user_profile.dart';
// import 'package:sustainable_world/data/repository/contract/auth_repository.dart';
// import 'package:sustainable_world/data/repository/remote/remote_auth_repository.dart';

// var signUpViewModelProvider = ChangeNotifierProvider((ref) {
//   return SignUpViewModel(ref.watch(remoteAuthRepositoryProvider));
// });

// class SignUpViewModel with ChangeNotifier {
//   UserDetails? _userDetails;
//   String? confirmPassword;
//   bool _loading;
//   final AuthRepository _authRepository;

//   SignUpViewModel(this._authRepository)
//       : _userDetails = const UserDetails(
//           userProfile: UserProfile(userType: UserType.DISPOSER),
//         ),
//         _loading = false;

//   UserDetails? get userDetails => _userDetails;

//   bool get loading => _loading;

//   void uploadUserDetails() {
//     log(userDetails!.toJson().toString());
//   }

//   Future<void> signUp() async {
//     _loading = true;
//     notifyListeners();
//     return await _authRepository
//         .signUp(userDetails: _userDetails!)
//         .whenComplete(() {
//       _loading = false;
//       notifyListeners();
//     });
//   }

//   void updateUserDetails(UserDetails? value) {
//     _userDetails = value;
//     notifyListeners();
//   }
// }
