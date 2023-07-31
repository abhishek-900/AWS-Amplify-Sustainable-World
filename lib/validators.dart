import 'dart:io';

import 'package:validated/validated.dart' as validate;

class Validators {
  Validators._();

  static String? emailValidator(String? value) {
    value = value ?? "";
    if (value.isEmpty) return "Email address is required";
    return validate.isEmail(value) ? null : "Invalid email address";
  }

  static String? passwordValidator(String? value) {
    value = value ?? "";
    if (value.isEmpty) return "Password is required";
    return null;
  }

  static String? nonEmptyValidator(String? value) {
    value = value ?? "";
    if (value.isEmpty) return "This field is required";
    return null;
  }

  static String? imageFilesValidator(List<File>? files) {
    files = files ?? [];
    if (files.isEmpty) return "Atleast one image is required";
    if (files.length > 5) return "Atmost five images can be uploaded";
    return null;
  }
}
