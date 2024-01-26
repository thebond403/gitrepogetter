import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gitstaredrepogetter/layers/domain/usecases/home_usecase.dart';
import 'package:gitstaredrepogetter/layers/presentation/home/home_page/provider/home_page_controller.dart';
import 'package:gitstaredrepogetter/layers/presentation/home/home_page/provider/home_page_state.dart';

final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageController, HomePageState>(
        (ref) => HomePageController(HomePageState(),
            usecase: ref.read(homeUsecaseProvider)));
