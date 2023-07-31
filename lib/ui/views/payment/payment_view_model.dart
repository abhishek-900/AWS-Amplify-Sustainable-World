import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/Order.dart';

var paymentViewModelProvider =
    ChangeNotifierProvider((ref) => PaymentViewModel());

class PaymentViewModel with ChangeNotifier {
  bool _savedCardIsCheck;

  PaymentViewModel() : _savedCardIsCheck = false;

  bool get saveCardIsCheck => _savedCardIsCheck;

  void toggle(bool value) {
    _savedCardIsCheck = value;
    notifyListeners();
  }

  Future<void> createOrder({required Order order}) async {}
}
