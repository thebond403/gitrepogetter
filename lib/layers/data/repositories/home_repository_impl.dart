import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gitstaredrepogetter/layers/data/dto/home/repository_response_dto.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/entities/home_entities/last_fetch_time_entity_ob.dart';
import 'package:gitstaredrepogetter/layers/data/source/home/home_git_repo_source_local.dart';
import 'package:gitstaredrepogetter/layers/data/source/home/home_git_repo_source_network.dart';
import 'package:gitstaredrepogetter/layers/domain/repositories/home_repository.dart';

final homeRepositoryProvider =
    Provider<HomeRepository>((ref) => HomeRepositoryImpl());

class HomeRepositoryImpl implements HomeRepository {
  
  factory HomeRepositoryImpl() {
    return _instance;
  }
  static HomeRepositoryImpl get _instance => HomeRepositoryImpl._();
  HomeRepositoryImpl._() {
    localSource = HomeGitRepoSourceLocal();
    networkSource = HomeGitRepoSourceNetwork();
  }


  late HomeGitRepoSourceNetwork networkSource;
  late HomeGitRepoSourceLocal localSource;

  final int minuteDifference = 30;
  
  @override
  Future<List<RepositoryResponseDto>> getRepositories(
      {required Map<String, dynamic> query,
      bool forceToLoadFromApi = false}) async {
    int perPage = query['per_page'] ?? 10;
    int pageNo = query['page'] ?? 1;
    try {
      final totalSavedRepos = await localSource.getSavedReposCount();
      if (totalSavedRepos < (perPage * pageNo)) {
        forceToLoadFromApi = true;
      } 
    } catch (error) {
      log(error.toString());
    }
    LastFetchTimeEntityOb lastFetchTime = await localSource.getLastFetchTime();
    DateTime now = DateTime.now();
    List<RepositoryResponseDto> repos = [];
    final timeDifferenceInMinutes =
        now.difference(lastFetchTime.lastFetchTime!).inMinutes;
    if (forceToLoadFromApi || timeDifferenceInMinutes >
            minuteDifference) {
      try {
        repos = await networkSource.getRepositoryByKeyword(query: query);
        await localSource.saveLastUpdateData(DateTime.now(),
            id: lastFetchTime.id);
      } catch (error) {
        log("Error fatching data");
      }
      if (repos.isNotEmpty) {
        await localSource.saveRepositoryToLocal(repos);
      }
    }
    repos =
        await localSource.getRepositoryFromLocal(count: perPage, page: pageNo);
    return repos;
  }
}
