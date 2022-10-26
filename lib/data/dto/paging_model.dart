import 'package:chomoi/domain/models/paging.dart';
import 'article_model.dart';

class PagingModel extends Paging {
  PagingModel({
    required this.totalResults,
    required this.articles,
  }) : super(articles: articles, totalResults: totalResults);

  final int totalResults;
  final List<ArticleModel> articles;

  @override
  factory PagingModel.fromJson(Map<String, dynamic> json) => PagingModel(
        totalResults: json["totalResults"],
        articles:
            List.from(json["articles"].map((x) => ArticleModel.fromJson(x))),
      );
}
