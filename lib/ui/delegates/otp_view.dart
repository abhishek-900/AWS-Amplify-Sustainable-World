import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/data/repository/remote/remote_aws_auth_repository.dart';
import 'package:sustainable_world/ui/views/authentication/authentication_view.dart';

class OTPView extends HookConsumerWidget {
  const OTPView(this.email, {super.key});

  final String email;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var confirmationCode = useState<String>("");
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Enter OTP"),
            const SizedBox(height: 10),
            Text("OTP will be sent to $email"),
            const SizedBox(height: 10),
            OtpTextField(
              numberOfFields: 6,
              showFieldAsBox: true,
              onCodeChanged: (String value) {},
              onSubmit: (String verificationCode) {
                confirmationCode.value = verificationCode;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  ref.read(remoteAWSAuthRepositoryProvider).confirmSignUp(
                        email: email,
                        confirmationCode: confirmationCode.value,
                      );
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AuthenticationView.routeName, (route) => false);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
              child: const Text("Verify"),
            )
          ],
        ),
      ),
    );
  }
}
