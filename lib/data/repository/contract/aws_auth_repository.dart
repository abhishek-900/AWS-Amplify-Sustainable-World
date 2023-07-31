import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:sustainable_world/models/UserDetail.dart';

abstract class AWSAuthRepository {
  Future<SignInResult> signIn({
    required String email,
    required String password,
  });
  Future<SignUpResult> signUp({
    required String email,
    required String password,
    required UserDetail userDetails,
  });
  Future<SignUpResult> confirmSignUp({
    required String email,
    required String confirmationCode,
  });
  Future<void> signOut();
  Future<AuthSession> isUserSignedIn();
  Future<AuthUser?> getCurrentUser();
}
