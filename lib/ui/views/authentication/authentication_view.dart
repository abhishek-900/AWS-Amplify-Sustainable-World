import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sustainable_world/data/repository/remote/remote_aws_auth_repository.dart';
import 'package:sustainable_world/ui/views/home/home_view.dart';
import 'package:sustainable_world/ui/views/sign_up/sign_up_view.dart';
import 'package:sustainable_world/validators.dart';

class AuthenticationView extends HookConsumerWidget {
  static const String routeName = "/Authentication";

  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    var emailController = useTextEditingController();
    var passwordController = useTextEditingController();
    var isLoading = useState(false);
    return LoadingOverlay(
      isLoading: isLoading.value,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: Form(
          child: Builder(
            builder: (context) => Column(
              children: [
                const SizedBox(height: 64),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Image.asset(
                    "assets/images/sustainable_world_logo.png",
                    color: Colors.white,
                    width: size.width * 0.6,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    margin: EdgeInsets.zero,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 4,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(height: 40),
                            TextFormField(
                              controller: emailController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: Validators.emailValidator,
                              onChanged: (value) {
                                final selection = emailController.selection;
                                emailController.text = value;
                                emailController.selection = selection;
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: "Email",
                                hintText: "Enter your registered email address",
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: passwordController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
                              onChanged: (value) {
                                final selection = passwordController.selection;
                                passwordController.text = value;
                                passwordController.selection = selection;
                              },
                              validator: Validators.passwordValidator,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                labelText: "Password",
                                hintText: "Enter password",
                              ),
                              obscureText: true,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text("Forgot your password ?"),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  if (Form.of(context).validate()) {
                                    await _signIn(
                                      emailController.text,
                                      passwordController.text,
                                      ref,
                                      context,
                                      isLoading,
                                    );
                                  }
                                },
                                icon: const Icon(Icons.login),
                                label: const Text("Sign In"),
                              ),
                            ),
                            const SizedBox(height: 32),
                            OutlinedButton.icon(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(SignUpView.routeName),
                              icon: const Icon(Icons.person_add),
                              label:
                                  const Text("Don't have an account? Sign up!"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signIn(
    String email,
    String password,
    WidgetRef ref,
    BuildContext context,
    ValueNotifier<bool> isLoading,
  ) async {
    try {
      var navigator = Navigator.of(context);
      isLoading.value = true;
      await ref
          .read(remoteAWSAuthRepositoryProvider)
          .signIn(email: email, password: password);
      isLoading.value = false;

      navigator.pushNamedAndRemoveUntil(HomeView.routeName, (route) => false);
    } on AuthException catch (e) {
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("We are sorry, something went wrong - ${e.message}"),
        ),
      );
    }
  }
}
