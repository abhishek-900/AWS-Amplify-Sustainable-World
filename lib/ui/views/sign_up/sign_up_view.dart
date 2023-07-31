import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:sustainable_world/data/repository/remote/remote_aws_auth_repository.dart';
import 'package:sustainable_world/models/UserDetail.dart';
import 'package:sustainable_world/models/UserType.dart';
import 'package:sustainable_world/ui/delegates/otp_view.dart';
import 'package:sustainable_world/ui/modular/account_type_card.dart';
import 'package:sustainable_world/ui/modular/fixed_bottom_button_bar.dart';
import 'package:sustainable_world/validators.dart';

class SignUpView extends HookConsumerWidget {
  static const String routeName = "/sign-up";

  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userDetails = useState<UserDetail>(UserDetail(
      userType: UserType.DISPOSER,
    ));
    var password = useState<String>("");

    var isLoading = useState(false);
    return Form(
      child: Builder(builder: (context) {
        return LoadingOverlay(
          isLoading: isLoading.value,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Create new account"),
            ),
            body: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Account type",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Text(
                              "Select an account type below",
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: 1.2,
                              children: [
                                AccountTypeCard(
                                  image: const AssetImage(
                                      "assets/images/persona_disposer.jpg"),
                                  selected: userDetails.value.userType ==
                                      UserType.DISPOSER,
                                  labelText: "Individual",
                                  onPressed: () {
                                    userDetails.value =
                                        userDetails.value.copyWith(
                                      userType: UserType.DISPOSER,
                                    );
                                  },
                                ),
                                AccountTypeCard(
                                  image: const AssetImage(
                                      "assets/images/persona_recycler.jpg"),
                                  selected: userDetails.value.userType ==
                                      UserType.RECYCLER,
                                  labelText: "Company",
                                  onPressed: () {
                                    userDetails.value = userDetails.value
                                        .copyWith(userType: UserType.RECYCLER);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Personal Information",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: Validators.nonEmptyValidator,
                              onChanged: (value) {
                                userDetails.value = userDetails.value
                                    .copyWith(firstName: value);
                              },
                              decoration: const InputDecoration(
                                labelText: "First name *",
                                hintText: "Enter your first name",
                                prefixIcon: Icon(Icons.title),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: Validators.nonEmptyValidator,
                              onChanged: (value) {
                                userDetails.value =
                                    userDetails.value.copyWith(lastName: value);
                              },
                              decoration: const InputDecoration(
                                labelText: "Last name *",
                                hintText: "Enter your last name",
                                prefixIcon: Icon(Icons.subject),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Account information",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: Validators.emailValidator,
                              onChanged: (value) {
                                userDetails.value =
                                    userDetails.value.copyWith(email: value);
                              },
                              decoration: const InputDecoration(
                                labelText: "Email address *",
                                hintText: "Enter your email address",
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: Validators.nonEmptyValidator,
                              onChanged: (value) {
                                password.value = value;
                              },
                              decoration: const InputDecoration(
                                labelText: "Password *",
                                hintText: "Enter a new password",
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == password.value) {
                                  return null;
                                }
                                return "Password didn't match";
                              },
                              onChanged: (value) {},
                              decoration: const InputDecoration(
                                labelText: "Confirm password *",
                                hintText: "Enter a new password",
                                prefixIcon: Icon(Icons.password),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 16),
                            if (userDetails.value.userType == UserType.RECYCLER)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Company information",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    textInputAction: TextInputAction.next,
                                    validator: Validators.nonEmptyValidator,
                                    onChanged: (value) {
                                      userDetails.value =
                                          userDetails.value.copyWith(
                                        companyName: value,
                                      );
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "Company name *",
                                      hintText: "Enter a Company name",
                                      prefixIcon: Icon(Icons.location_city),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    textInputAction: TextInputAction.next,
                                    validator: Validators.nonEmptyValidator,
                                    onChanged: (value) {
                                      userDetails.value =
                                          userDetails.value.copyWith(
                                        companyAddress: value,
                                      );
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "Company address *",
                                      hintText: "Enter your address",
                                      prefixIcon:
                                          Icon(Icons.edit_location_outlined),
                                    ),
                                  ),
                                ],
                              ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Referral",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.info),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  onChanged: (value) {
                                    userDetails.value =
                                        userDetails.value.copyWith(
                                      referralCode: value,
                                    );
                                  },
                                  decoration: const InputDecoration(
                                    labelText: "Referral code",
                                    hintText:
                                        "Enter referral code if you have one",
                                    prefixIcon: Icon(LineIcons.alternateTicket),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FixedBottomButtonBar(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        primaryFocus?.unfocus();
                        if (Form.of(context).validate()) {
                          _signUp(context, ref, userDetails.value,
                              password.value, isLoading);
                        }
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text("Proceed"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<void> _signUp(
    BuildContext context,
    WidgetRef ref,
    UserDetail userDetails,
    String password,
    ValueNotifier<bool> isLoading,
  ) async {
    var scaffoldMessager = ScaffoldMessenger.of(context);
    isLoading.value = true;
    try {
      SignUpResult result = await ref
          .read(remoteAWSAuthRepositoryProvider)
          .signUp(
              password: password,
              email: userDetails.email!,
              userDetails: userDetails);
      isLoading.value = false;
      if (context.mounted) {
        _handleSignUpResult(result, context, userDetails.email!, ref);
      }
    } on AuthException catch (e) {
      isLoading.value = false;
      scaffoldMessager.showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    }
  }

  Future<void> _handleSignUpResult(
    SignUpResult result,
    BuildContext context,
    String email,
    WidgetRef ref,
  ) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OTPView(email),
          ),
        );

        break;
      case AuthSignUpStep.done:
        Navigator.of(context).pop();
        break;
    }
  }
}
