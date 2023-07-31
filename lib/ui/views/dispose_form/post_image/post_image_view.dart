import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/ui/form_fields/file_images_form_field.dart';
import 'package:sustainable_world/ui/modular/fixed_bottom_button_bar.dart';
import 'package:sustainable_world/ui/views/dispose_form/close_dispose_form_button.dart';
import 'package:sustainable_world/ui/views/dispose_form/contribution_type/contribution_type_view.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_provider.dart';
import 'package:sustainable_world/validators.dart';

class PostImageView extends ConsumerWidget {
  const PostImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var disposeForm = ref.watch(disposeFormProvider);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: const [
              CloseDisposeFormButton(),
            ],
            title: const Text("Images"),
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
                              "Add Images",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Text(
                              "Add images for your posting",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: FileImagesFormField(
                        initialValue: disposeForm.data['images'],
                        onChanged: (value) async {
                          disposeForm.setData(
                            (oldData) => {
                              ...oldData,
                              'producImages': [
                                ...value!.map((e) => e.path).toList(),
                              ]
                            },
                          );
                        },
                        validator: Validators.imageFilesValidator,
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
                          builder: (context) => const ContributionTypeView(),
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
