import 'dart:io';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FileImageCard extends StatelessWidget {
  const FileImageCard(
      {required this.imageFile,
      required this.fileNumber,
      required this.onDelete,
      Key? key})
      : super(key: key);

  final int fileNumber;
  final File imageFile;
  final void Function(File) onDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.file(
          imageFile,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Material(
            elevation: 4.0,
            clipBehavior: Clip.hardEdge,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
            ),
            color: Colors.redAccent,
            child: IconButton(
              icon: const Icon(
                LineIcons.trash,
                color: Colors.white,
              ),
              onPressed: () => onDelete(imageFile),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
            ),
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: Text(
                "$fileNumber",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
