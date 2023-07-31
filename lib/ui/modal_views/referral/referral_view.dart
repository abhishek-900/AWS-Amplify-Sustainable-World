import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sustainable_world/ui/modal_views/referral/referral_view_model.dart';
import 'package:sustainable_world/ui/modal_views/referral/widgets/referral_message.dart';

class ReferralView extends ConsumerWidget {
  const ReferralView({
    required this.inviteCode,
    required this.message,
    Key? key,
  }) : super(key: key);

  final String inviteCode;
  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(referralViewModelProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Image.network(
              "https://image.shutterstock.com/image-vector/back-view-teenage-boys-girls-260nw-1290729508.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const ReferralMessage(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 8),
                          Text(
                            inviteCode,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: viewModel.showCopied
                                        ? Colors.grey
                                        : Colors.black),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () =>
                                viewModel.invitationCode = inviteCode,
                            child: const Text("Tap to copy"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          await Share.share(message);
                        },
                        icon: const Icon(LineIcons.share),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                viewModel.showCopied
                    ? Chip(
                        backgroundColor: Colors.grey.shade300,
                        label: const Text("Copied!"),
                      )
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
