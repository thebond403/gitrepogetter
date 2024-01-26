import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gitstaredrepogetter/core/enums/enums.dart';
import 'package:gitstaredrepogetter/layers/domain/usecases/home_usecase.dart';
import 'package:gitstaredrepogetter/layers/presentation/home/home_page/provider/home_page_state.dart';

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController(super.state, {required this.usecase}) {
    getRepos();
  }

  final HomeUsecase usecase;
  
  bool get isLoading => state.status == DataLoadStatus.loading;
  
  getRepos(
      {String keyword = "Flutter", int perPage = 10}) async {
    if (isLoading) return;
    int initialPage = 1;
    Map<String, dynamic> query = {
      "q": keyword,
      "per_page": perPage,
      "page": initialPage
    };
    state = state.copyWith(status: DataLoadStatus.loading);
    try {
      final repos = await usecase.getGitRepository(query: query);
      state = state.copyWith(
          status: DataLoadStatus.success,
          repos: repos,
          currentPage: initialPage);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(
          status: DataLoadStatus.failure, repos: [], currentPage: initialPage);
    }
  }

  loadMoreRepos({String keyword = "Flutter", int perPage = 10}) async {
    if (isLoading) return;
    int pageNo = state.currentPage + 1;
    Map<String, dynamic> query = {
      "q": keyword,
      "per_page": perPage,
      "page": pageNo
    };
    state = state.copyWith(status: DataLoadStatus.loading);
    try {
      final repos = await usecase.getGitRepository(query: query);
      final prevRepos = state.repos;
      state = state.copyWith(
          status: DataLoadStatus.success,
          repos: [...prevRepos, ...repos],
          currentPage: pageNo);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(
          status: DataLoadStatus.failure, repos: []);
    }
  }
}
