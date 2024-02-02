import 'package:gitstaredrepogetter/layers/data/dto/home/repository_response_dto.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/boxes/home_boxes/last_fetch_time_entity_box.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/boxes/home_boxes/repository_response_entity_box.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/entities/home_entities/last_fetch_time_entity_ob.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/entities/home_entities/repository_response_entity_ob.dart';
import 'package:gitstaredrepogetter/objectbox.g.dart';

class HomeGitRepoSourceLocal {
  late final RepositoryResponseEntityBox _repoBox;
  late final LastFetchTimeEntityBox _lastFetchTimeBox;

  HomeGitRepoSourceLocal() {
    _repoBox = RepositoryResponseEntityBox();
    _lastFetchTimeBox = LastFetchTimeEntityBox();
  }

  Future<List<RepositoryResponseDto>> getRepositoryFromLocal(
      {int page = 1, int count = 10, int order = 1}) async {
    // final orderBy = order == 1
    //     ? RepositoryResponseEntityOb_.stargazersCount
    //     : RepositoryResponseEntityOb_.updatedAt;
    Query<RepositoryResponseEntityOb> query = 
        _repoBox
        .query(RepositoryResponseEntityOb_.id.greaterThan(0))
        .order(RepositoryResponseEntityOb_.stargazersCount,
            flags: Order.descending)
        .build();
    query.limit = count;
    if (page > 1) {
      query.offset = (page - 1) * count;
    }
    final res = await query.findAsync();
    final resDto = res.map((e) => e.toRepositoryResponseDto).toList();
    return resDto;
  }

  Future<bool> saveRepositoryToLocal(List<RepositoryResponseDto> repos) async {
    List<RepositoryResponseEntityOb> repoEntities =
        repos.map((e) => e.toRepositoryResponseEntityOb).toList();

    List<int> savedIds = await _repoBox.updateManyAsync(repoEntities);
    if (savedIds.isNotEmpty) {
      return true;
    }
    return false;
  }
  Future<int> getSavedReposCount() async {
    final count = (await _repoBox.getAllAsync()).length;
    return count;
  }
  Future<LastFetchTimeEntityOb> getLastFetchTime() async {
    final allData = _lastFetchTimeBox.getAll();
    if (allData.isNotEmpty) {
      return allData.first;
    }
    return LastFetchTimeEntityOb(id: 0, lastFetchTime: DateTime(1990));
  }

  Future<bool> saveLastUpdateData(DateTime time, {int? id}) async {
    int savedId = await _lastFetchTimeBox
        .updateAsync(LastFetchTimeEntityOb(id: id ?? 0, lastFetchTime: time));
    if (savedId > 0) {
      return true;
    }
    return false;
  }
}
