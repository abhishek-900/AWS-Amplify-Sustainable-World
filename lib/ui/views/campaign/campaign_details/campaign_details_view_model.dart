import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/ModelProvider.dart';

var campaignDetailsViewModelProvider =
    ChangeNotifierProvider.family<CampaignDetailsViewModel, dynamic>(
        (ref, id) => CampaignDetailsViewModel(id));

class CampaignDetailsViewModel with ChangeNotifier {
  CampaignModelIdentifier? campaignId;
  Campaign? _campaign;
  bool _loading = false;

  CampaignDetailsViewModel(this.campaignId) {
    getCampaignById(campaignId);
  }

  bool get loading => _loading;
  Campaign? get campaign => _campaign;

  Future<void> getCampaignById(dynamic id) async {
    try {
      _loading = true;
      notifyListeners();
      final request = ModelQueries.get(Campaign.classType, id);
      final response = await Amplify.API.query(request: request).response;
      _loading = false;
      notifyListeners();
      _campaign = response.data;
      if (_campaign == null) {
        safePrint('errors: ${response.errors}');
      }
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      _loading = false;
      notifyListeners();
      return;
    }
  }
}
