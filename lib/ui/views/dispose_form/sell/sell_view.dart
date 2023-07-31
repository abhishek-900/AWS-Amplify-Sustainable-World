import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:sustainable_world/ui/modular/fixed_bottom_button_bar.dart';
import 'package:sustainable_world/ui/views/dispose_form/close_dispose_form_button.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_provider.dart';
import 'package:sustainable_world/ui/views/dispose_form/post_location/post_location_view.dart';
import 'package:sustainable_world/validators.dart';

class SellView extends ConsumerWidget {
  const SellView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var disposeForm = ref.watch(disposeFormProvider);
    return Form(
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Selling Price"),
            actions: const [
              CloseDisposeFormButton(),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "How much do you want for the items?",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Text(
                              "Enter the amount to proceed.",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate.fixed(
                          [
                            TextFormField(
                              initialValue: disposeForm.data['amount'] != null
                                  ? disposeForm.data['amount'].toString()
                                  : "",
                              onChanged: (value) {
                                disposeForm.setData(
                                  (oldData) => {
                                    ...oldData,
                                    'amount': double.tryParse(value) ?? 0.0,
                                  },
                                );
                              },
                              validator: Validators.nonEmptyValidator,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                FilteringTextInputFormatter.singleLineFormatter,
                                LengthLimitingTextInputFormatter(8),
                              ],
                              decoration: const InputDecoration(
                                labelText: "Amount *",
                                prefixIcon: LineIcon.indianRupeeSign(),
                                hintText: "Enter the amount",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FixedBottomButtonBar(
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (Form.of(context).validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PostLocationView(),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.file_download_done_sharp),
                  label: const Text("Proceed"),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
