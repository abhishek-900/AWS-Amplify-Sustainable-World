import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/UserDetail.dart';

var selectOrganizationViewModelProvider = ChangeNotifierProvider(
  (ref) {
    return SelectOrganizationViewModel();
  },
);

class SelectOrganizationViewModel with ChangeNotifier {
  final TextEditingController searchController;

  List<UserDetail?> _organization;

  List<bool> _isCheckorg;
  final List<UserDetail> _selectiveRecyclers;

  SelectOrganizationViewModel()
      : _organization = [],
        _isCheckorg = [],
        _selectiveRecyclers = [],
        searchController = TextEditingController() {
    fetchOrg().then((value) =>
        _isCheckorg = List<bool>.filled(_organization.length, false));
  }

  List<UserDetail?> get organization => _organization;
  List<bool> get isCheckorg => _isCheckorg;
  List<UserDetail> get selectiveRecyclers => _selectiveRecyclers;

  void prepareSelectiveRecyclers(UserDetail user, bool check, int index) {
    if (check) {
      _selectiveRecyclers.add(user);
    } else {
      _selectiveRecyclers.removeAt(index);
    }
  }

  toggleCheckOrg(value, index) {
    _isCheckorg[index] = value;
    notifyListeners();
  }

  Future<void> fetchOrg() async {
    try {
      final request = ModelQueries.list(UserDetail.classType,
          where: UserDetail.USERTYPE.eq("RECYCLER"));
      final response = await Amplify.API.query(request: request).response;

      final organization = response.data?.items;
      if (organization == null) {
        safePrint('errors: ${response.errors}');
        _organization = [];
      } else {
        _organization = organization;
      }
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      _organization = [];
      notifyListeners();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
