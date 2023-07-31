import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sustainable_world/ui/modal_views/post_image_viewer/post_image_viewer_view.dart';
import 'package:sustainable_world/ui/modal_views/referral/referral_view.dart';
import 'package:sustainable_world/ui/views/shop_filter/shop_filter_view.dart';

class Modals {
  Modals._();

  static Future<ImageSource?> showImageSourcePicker({
    required BuildContext context,
  }) {
    return showModalBottomSheet<ImageSource?>(
      context: context,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            trailing: const Icon(Icons.chevron_right),
            title: const Text("Camera"),
            subtitle: const Text("Take a photo from your camera"),
            onTap: () => Navigator.of(context).pop(
              ImageSource.camera,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.video_camera_back),
            trailing: const Icon(Icons.chevron_right),
            title: const Text("Gallery"),
            subtitle: const Text("Pick images from gallery."),
            onTap: () => Navigator.of(context).pop(
              ImageSource.gallery,
            ),
          ),
        ],
      ),
    );
  }

  static Future<bool> showCancelPrompt({
    required BuildContext context,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Exit"),
          content: const Text(
              "Your input so far will be discarded. Do you want to exit?"),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("No")),
            TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("Yes")),
          ],
        );
      },
    ).then((value) => value ?? false);
  }

  static Future<Set<String>?> showShopFilter(BuildContext context) async {
    final data = await Navigator.of(context).push<Set<String>>(
      MaterialPageRoute(
        builder: (context) => const ShopFilterView(),
      ),
    );

    return data;
  }

  static Future<int?> showPostImageViewer(
    BuildContext context, {
    required List<String> imageUrls,
    required String postTitle,
    required ImageProvider<Object> userImage,
    required String userName,
    required int initialPage,
  }) {
    return Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (context) => PostImageViewerView(
          imageUrls: imageUrls,
          postTitle: postTitle,
          userImage: userImage,
          userName: userName,
          initialPage: initialPage,
        ),
      ),
    );
  }

  static Future<void> showReferralCode({
    required BuildContext context,
    required String inviteCode,
    required String message,
  }) {
    return showModalBottomSheet(
      constraints: BoxConstraints.tight(
          Size.fromHeight(MediaQuery.of(context).size.height * 0.7)),
      context: context,
      builder: (context) => ReferralView(
        inviteCode: inviteCode,
        message: message,
      ),
    );
  }
}
