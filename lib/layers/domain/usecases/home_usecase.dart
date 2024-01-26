import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gitstaredrepogetter/layers/data/repositories/home_repository_impl.dart';
import 'package:gitstaredrepogetter/layers/domain/entities/home/repository_response_entity.dart';
import 'package:gitstaredrepogetter/layers/domain/repositories/home_repository.dart';


final homeUsecaseProvider =
    Provider((ref) => HomeUsecase(ref.read(homeRepositoryProvider)));
class HomeUsecase {
  HomeUsecase(this.repository);
  HomeRepository repository;

  Future<List<RepositoryResponseEntity>> getGitRepository(
      {required Map<String, dynamic> query}) async {
    return await repository.getRepositories(query: query);
  }
}
