import 'package:gitstaredrepogetter/layers/domain/entities/home/repository_response_entity.dart';

abstract class HomeRepository {
  Future<List<RepositoryResponseEntity>> getRepositories(
      {required Map<String, dynamic> query, bool forceToLoadFromApi = false});
}
