import 'package:chomoi/domain/models/paging.dart';

import '../../app/core/usecases/pram_usecase.dart';
import '../repositories/article_repository.dart';
import 'package:tuple/tuple.dart';

class FetchHeadlineUseCase extends ParamUseCase<Paging, Tuple2<int, int>> {
  final ArticleRepository _repo;
  FetchHeadlineUseCase(this._repo);

  @override
  Future<Paging> call(Tuple2 param) {
    return _repo.fetchHeadline(param.item1, param.item2);
  }
}
