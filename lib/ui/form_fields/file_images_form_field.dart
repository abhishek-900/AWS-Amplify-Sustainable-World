import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sustainable_world/ui/modals.dart';
import 'package:sustainable_world/ui/modular/add_image_card_button.dart';
import 'package:sustainable_world/ui/modular/file_image_card.dart';

class FileImagesFormField extends FormField<List<File>> {
  FileImagesFormField({
    List<File>? initialValue,
    AutovalidateMode? autovalidateMode,
    bool enabled = true,
    void Function(List<File>?)? onSaved,
    void Function(List<File>?)? onChanged,
    String? restorationId,
    String? Function(List<File>?)? validator,
    Key? key,
  }) : super(
          key: key,
          autovalidateMode: autovalidateMode,
          enabled: enabled,
          onSaved: onSaved,
          restorationId: restorationId,
          validator: validator,
          initialValue: initialValue,
          builder: (state) {
            int imageCount = state.value?.length ?? 0;
            return IgnorePointer(
              ignoring: !enabled,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white54,
                  !enabled ? BlendMode.srcATop : BlendMode.dst,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 1,
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      padding: const EdgeInsets.all(8),
                      itemCount: imageCount + 1,
                      itemBuilder: (context, index) {
                        if (index == imageCount) {
                          return AddImageCardButton(
                            onPresesd: () async {
                              primaryFocus?.unfocus(
                                disposition:
                                    UnfocusDisposition.previouslyFocusedChild,
                              );
                              List<File>? images = await _getImages(context);
                              if (images != null) {
                                final updated = <File>[
                                  ...state.value ?? <File>[],
                                  ...images
                                ];
                                onChanged?.call(updated);
                                state.didChange(updated);
                              }
                            },
                          );
                        } else {
                          return FileImageCard(
                            key: ValueKey(state.value!.elementAt(index)),
                            fileNumber: index + 1,
                            imageFile: state.value!.elementAt(index),
                            onDelete: (file) {
                              final data = [...state.value!];
                              data.remove(file);
                              state.didChange(data);
                              onChanged?.call(data);
                            },
                          );
                        }
                      },
                    ),
                    if (state.hasError)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8.0),
                        child: Text(
                          state.errorText!,
                          style: Theme.of(state.context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Theme.of(state.context)
                                      .colorScheme
                                      .error),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );

  static Future<List<File>?> _getImages(BuildContext context) async {
    try {
      final imageSource = await Modals.showImageSourcePicker(context: context);
      if (imageSource != null) {
        if (imageSource == ImageSource.camera) {
          final pickedImage =
              await ImagePicker().pickImage(source: imageSource);
          if (pickedImage != null) {
            return [
              File(pickedImage.path),
            ];
          }
        } else {
          final pickedImages = await ImagePicker().pickMultiImage();
          return pickedImages
              .map((pickedImage) => File(pickedImage.path))
              .toList();
        }
        return null;
      }
    } on PlatformException {
      return null;
    }
    return null;
  }
}
