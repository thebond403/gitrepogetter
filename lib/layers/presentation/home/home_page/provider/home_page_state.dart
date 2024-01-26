import 'package:gitstaredrepogetter/core/enums/enums.dart';
import 'package:gitstaredrepogetter/layers/domain/entities/home/repository_response_entity.dart';

class HomePageState {
  DataLoadStatus status;
  List<RepositoryResponseEntity> repos;
  int currentPage = 1;
  HomePageState({
    this.status = DataLoadStatus.initial,
    this.repos = const [],
    this.currentPage = 1,
  });

  HomePageState copyWith({
    DataLoadStatus? status,
    List<RepositoryResponseEntity>? repos,
    int? currentPage,
  }) {
    return HomePageState(
      status: status ?? this.status,
      repos: repos ?? this.repos,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
