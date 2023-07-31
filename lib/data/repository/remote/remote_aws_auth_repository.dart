import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/data/repository/contract/aws_auth_repository.dart';
import 'package:sustainable_world/models/UserDetail.dart';

var remoteAWSAuthRepositoryProvider = Provider<RemoteAWSAuthRepository>((ref) {
  return RemoteAWSAuthRepository();
});

class RemoteAWSAuthRepository implements AWSAuthRepository {
  @override
  Future<AuthUser?> getCurrentUser() async {
    try {
      return Amplify.Auth.getCurrentUser();
    } on AuthException catch (e) {
      safePrint(e);
      return null;
    }
  }

  @override
  Future<AuthSession> isUserSignedIn() {
    try {
      return Amplify.Auth.fetchAuthSession();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SignInResult> signIn(
      {required String email, required String password}) async {
    try {
      return await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
    } on AuthException catch (e) {
      safePrint('Could not login - ${e.message}');
      rethrow;
    }
  }

  @override
  Future<SignUpResult> signUp({
    required String password,
    required String email,
    required UserDetail userDetails,
  }) async {
    try {
      return await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: {
            const CognitoUserAttributeKey.custom('firstName'):
                userDetails.firstName ?? "",
            const CognitoUserAttributeKey.custom('lastName'):
                userDetails.lastName ?? "",
            const CognitoUserAttributeKey.custom('companyName'):
                userDetails.companyName ?? "",
            const CognitoUserAttributeKey.custom('companyAddress'):
                userDetails.companyAddress ?? "",
            const CognitoUserAttributeKey.custom('userRole'):
                userDetails.userType.toString().split(".")[1],
            AuthUserAttributeKey.email: userDetails.email!,
            AuthUserAttributeKey.address: userDetails.address ?? "",
            AuthUserAttributeKey.preferredUsername:
                "${userDetails.firstName} ${userDetails.lastName}",
          },
        ),
      );
    } on AuthException catch (e) {
      safePrint('Error signing up user: ${e.message}');
      rethrow;
    }
  }

  @override
  Future<SignUpResult> confirmSignUp(
      {required String email, required String confirmationCode}) async {
    try {
      return await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: confirmationCode,
      );
    } on AuthException catch (e) {
      safePrint('Could not verify code - ${e.message}');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      safePrint('Sign out completed successfully');
    } else if (result is CognitoFailedSignOut) {
      safePrint('Error signing user out: ${result.exception.message}');
    }
  }
}
