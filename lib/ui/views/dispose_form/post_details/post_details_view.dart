import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/ui/modular/fixed_bottom_button_bar.dart';
import 'package:sustainable_world/ui/views/dispose_form/close_dispose_form_button.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_provider.dart';
import 'package:sustainable_world/ui/views/dispose_form/post_image/post_image_view.dart';
import 'package:sustainable_world/validators.dart';

class PostDetailsView extends ConsumerWidget {
  const PostDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var disposeForm = ref.watch(disposeFormProvider);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Details"),
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
                              "Post Details",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Text(
                              "Please fill the form below to proceed.",
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
                              initialValue: disposeForm.data['title'],
                              onChanged: (value) {
                                disposeForm.setData((oldData) {
                                  return {
                                    ...oldData,
                                    'title': value,
                                  };
                                });
                              },
                              validator: Validators.nonEmptyValidator,
                              maxLength: 50,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              decoration: const InputDecoration(
                                hintText: "Write a title for the post",
                                labelText: "Title *",
                                prefixIcon: Icon(Icons.title),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              initialValue: disposeForm.data['description'],
                              onChanged: (value) {
                                disposeForm.setData((oldData) => {
                                      ...oldData,
                                      'description': value,
                                    });
                              },
                              validator: Validators.nonEmptyValidator,
                              decoration: const InputDecoration(
                                labelText: "Description *",
                                hintText: "Describe your contribution",
                                prefixIcon: Icon(Icons.description),
                              ),
                              maxLength: 200,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              maxLines: 5,
                              minLines: 1,
                              textAlignVertical: TextAlignVertical.top,
                              textInputAction: TextInputAction.done,
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              initialValue: disposeForm.data['weight'] != null
                                  ? disposeForm.data['weight'].toString()
                                  : "",
                              onChanged: (value) {
                                disposeForm.setData((oldData) => {
                                      ...oldData,
                                      'weight': double.parse(value),
                                    });
                              },
                              validator: Validators.nonEmptyValidator,
                              decoration: const InputDecoration(
                                labelText: "Weight *",
                                hintText: "Product weight in kgs",
                                prefixIcon: Icon(Icons.shopping_bag_outlined),
                              ),
                              textAlignVertical: TextAlignVertical.top,
                              textInputAction: TextInputAction.done,
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
                          builder: (context) => const PostImageView(),
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
