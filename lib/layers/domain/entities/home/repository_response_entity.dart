import 'package:gitstaredrepogetter/layers/domain/entities/home/licence_entity.dart';
import 'package:gitstaredrepogetter/layers/domain/entities/home/owner_entity.dart';
import 'package:gitstaredrepogetter/layers/domain/entities/home/permission_entity.dart';

abstract class RepositoryResponseEntity {
  int id;
  String? name;
  String? fullName;
  bool? private;
  OwnerEntity? owner;
  String? htmlUrl;
  String? description;
  String? url;
  String? teamsUrl;
  String? languagesUrl;
  String? contributorsUrl;
  String? subscribersUrl;
  String? subscriptionUrl;
  String? commentsUrl;
  String? issuesUrl;
  String? pullsUrl;
  String? labelsUrl;
  String? releasesUrl;
  String? deploymentsUrl;
  String? createdAt;
  String? updatedAt;
  String? pushedAt;
  String? gitUrl;
  String? homepage;
  int? size;
  int? stargazersCount;
  int? watchersCount;
  String? language;
  bool? hasDiscussions;
  int? forksCount;
  bool? archived;
  bool? disabled;
  int? openIssuesCount;
  LicenseEntity? license;
  List<String>? topics;
  String? visibility;
  int? forks;
  int? openIssues;
  int? watchers;
  String? defaultBranch;
  PermissionsEntity? permissions;
  num? score;

  RepositoryResponseEntity({
    this.id = 0,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.url,
    this.teamsUrl,
    this.languagesUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commentsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasDiscussions,
    this.forksCount,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.permissions,
    this.score,
  });
  Map<String, dynamic> toJson();
}
