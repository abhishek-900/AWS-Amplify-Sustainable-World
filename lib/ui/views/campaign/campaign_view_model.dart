import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/ModelProvider.dart';

var campaignsProvider = FutureProvider((ref) {
  return CampaignViewModel().fetchCampaigns();
});

class CampaignViewModel {
  Future<List<Campaign?>> fetchCampaigns() async {
    try {
      final request = ModelQueries.list(Campaign.classType);
      final response = await Amplify.API.query(request: request).response;

      final campaigns = response.data?.items;
      if (campaigns == null) {
        safePrint('errors: ${response.errors}');
        return const [];
      }
      return campaigns;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return const [];
    }
  }
}
