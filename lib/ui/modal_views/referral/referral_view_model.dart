import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var referralViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => ReferralViewModel(),
);

class ReferralViewModel with ChangeNotifier {
  String inviteCode;
  bool _showCopied;

  ReferralViewModel()
      : inviteCode = "",
        _showCopied = false;

  set invitationCode(String code) {
    _showCopied = false;
    if (code.isNotEmpty) {
      inviteCode = code;
      _showCopied = true;
      Future.delayed(
        const Duration(milliseconds: 2000),
        () {
          _showCopied = false;
          notifyListeners();
        },
      );
    }
    notifyListeners();
  }

  bool get showCopied => _showCopied;
}
