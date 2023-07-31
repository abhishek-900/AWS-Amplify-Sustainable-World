import 'dart:io';

import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var postImageViewProvider =
    ChangeNotifierProvider((ref) => PostImageViewModel());

class PostImageViewModel with ChangeNotifier {
  PostImageViewModel();

  Future<Uri?> uploadFileToS3(File file) async {
    var awsFile = AWSFile.fromPath(file.path);

    try {
      var storageItem = Amplify.Storage.uploadFile(
        localFile: awsFile,
        key: file.path,
        options: const StorageUploadFileOptions(
          accessLevel: StorageAccessLevel.guest,
        ),
      );

      var out = await storageItem.result;
      var key = out.uploadedItem.key;
      return getImageUrl(key);
    } on StorageException catch (e) {
      safePrint('Error uploading file: $e');
      rethrow;
    }
  }

  Future<Uri> getImageUrl(String key) async {
    var out = Amplify.Storage.getUrl(key: key);
    return out.result.then((value) => value.url);
  }
}
