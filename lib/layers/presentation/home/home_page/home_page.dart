import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gitstaredrepogetter/core/constants/app_messages.dart';
import 'package:gitstaredrepogetter/core/enums/enums.dart';
import 'package:gitstaredrepogetter/core/routes/app_router.dart';
import 'package:gitstaredrepogetter/layers/presentation/home/home_page/provider/home_page_provider.dart';
import 'package:gitstaredrepogetter/layers/presentation/home/home_page/widgets/result_list_item.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageConroller = ref.watch(homePageProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Repo"),
        actions: [
          PopupMenuButton(
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                value: 1,
                child: Text("By Star"),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text("By Update Date"),
              ),
            ],
            onSelected: (value) {
              // print(value);
            },
          )
        ],
      ),
      bottomNavigationBar: (homePageConroller.repos.isNotEmpty &&
              homePageConroller.status == DataLoadStatus.loading)
          ? Container(
              height: 60,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: const Center(child: CircularProgressIndicator()),
            )
          : null,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (homePageConroller.status != DataLoadStatus.loading &&
              notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0.0) {
            ref.read(homePageProvider.notifier).loadMoreRepos();
            return true;
          }
          return true;
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: (homePageConroller.repos.isEmpty &&
                  homePageConroller.status == DataLoadStatus.loading)
              ? const SizedBox(
                  height: 600,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : homePageConroller.repos.isNotEmpty
                  ? ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        for (var repo in homePageConroller.repos)
                          ResultListItem(
                            item: repo,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRouter.repoDetailsPage,
                                  arguments: repo);
                            },
                          ),
                      ],
                    )
                  : const Center(
                      child: Text(AppMessages.noDataAvailable),
                    ),
        ),
      ),
    );
  }
}
