import 'package:flutter/material.dart';
import 'package:gitstaredrepogetter/layers/domain/entities/home/repository_response_entity.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  final mediumTextStyle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  final gap = const SizedBox(height: 8.0);

  @override
  Widget build(BuildContext context) {
    RepositoryResponseEntity repo =
        ModalRoute.of(context)?.settings.arguments as RepositoryResponseEntity;
    DateTime lastUpdated = DateTime.parse(repo.updatedAt ?? "");
    return Scaffold(
      appBar: AppBar(
        title: Text(repo.name ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                repo.owner?.avatarUrl ?? "",
                width: 100,
              ),
            ),
            gap,
            Text(
              repo.owner?.login ?? "",
            ),
            gap,
            Text(
              repo.fullName ?? "",
              style: mediumTextStyle,
            ),
            gap,
            Text(repo.description ?? ""),
            gap,
            Text(
                "Last Update: ${lastUpdated.month}-${lastUpdated.day}-${lastUpdated.year} ${lastUpdated.hour}:${lastUpdated.minute}"),
            gap,
            Text(
              "Stars: ${repo.stargazersCount}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
