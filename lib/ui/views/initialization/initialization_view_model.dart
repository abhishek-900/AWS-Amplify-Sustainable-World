import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/data/repository/remote/remote_aws_auth_repository.dart';
import 'package:sustainable_world/models/UserDetail.dart';

var inititalizationViewModelProvider =
    ChangeNotifierProvider<InititalizationViewModel>(
  (ref) => InititalizationViewModel(
    ref.read(remoteAWSAuthRepositoryProvider),
  ),
);

class InititalizationViewModel extends ChangeNotifier {
  final RemoteAWSAuthRepository _remoteAWSAuthRepository;
  bool _isUserSignedIn = false;
  String _errorMessage = "";
  InititalizationViewModel(this._remoteAWSAuthRepository)
      : _isUserSignedIn = false,
        _errorMessage = "" {
    checkUserSignedIn();
  }

  bool get isUserSignedIn => _isUserSignedIn;
  String get errorMessage => _errorMessage;

  Future<void> checkUserSignedIn() async {
    try {
      var result = await _remoteAWSAuthRepository.isUserSignedIn();

      _isUserSignedIn = result.isSignedIn;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<UserDetail?> getUserProfile() async {
    try {
      final id = await Amplify.Auth.getCurrentUser();
      UserDetail _userDetail = UserDetail(id: id.userId);
      final request =
          ModelQueries.get(UserDetail.classType, _userDetail.modelIdentifier);
      final response = await Amplify.API.query(request: request).response;
      final _user = response.data;
      if (_user == null) {
        safePrint('errors: ${response.errors}');
        return null;
      }
      return _user;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return null;
    }
  }
}
