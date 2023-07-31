import 'package:flutter/material.dart';

class Messages {
  Messages._();

  static SnackBar _makeSimpleSnackbar({
    required String text,
  }) {
    return SnackBar(
      content: Text(text),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showLoggedOut({required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      _makeSimpleSnackbar(
          text: "You have been logged out! Please log back in."),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showFailedToAuthenticate({
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(_makeSimpleSnackbar(text: "Failed to authenticate"));
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showProfileNotFound({
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(_makeSimpleSnackbar(text: "Profile not found"));
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showRegistrationFailed({
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(_makeSimpleSnackbar(
        text: "Registration Failed. Please try again later."));
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showRegistrationSuccessFully({
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
        _makeSimpleSnackbar(text: "Account Registered Successfully."));
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showRegisteredForTheCampaign({
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
        _makeSimpleSnackbar(text: "You Registered Successfully."));
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showRegisteredForTheCampaignFailed({
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(_makeSimpleSnackbar(
        text: "You Registration failed. Please try later."));
  }
}
