import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/ModelProvider.dart';

var articleProvider =
    FutureProvider((ref) => ArticleViewModel().fetchArticles());

class ArticleViewModel {
  ArticleViewModel();

  Future<List<Article?>> fetchArticles() async {
    try {
      final request = ModelQueries.list(Article.classType);
      final response = await Amplify.API.query(request: request).response;

      final articles = response.data?.items;
      if (articles == null) {
        safePrint('errors: ${response.errors}');
        return const [];
      }
      return articles;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return const [];
    }
  }
}
