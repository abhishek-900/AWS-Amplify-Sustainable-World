import 'package:flutter/material.dart';
import 'package:sustainable_world/ui/modals.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_view.dart';

class CloseDisposeFormButton extends StatelessWidget {
  const CloseDisposeFormButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Modals.showCancelPrompt(context: context).then((value) {
          if (value) {
            Navigator.of(context).popUntil(ModalRoute.withName(DisposeFormView.routeName));
            Navigator.of(context).pop();
          }
        });
      },
      icon: const Icon(
        Icons.close,
      ),
    );
  }
}
