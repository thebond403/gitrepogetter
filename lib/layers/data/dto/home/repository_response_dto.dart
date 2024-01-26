import 'package:gitstaredrepogetter/layers/data/dto/home/license.dart';
import 'package:gitstaredrepogetter/layers/data/dto/home/owner.dart';
import 'package:gitstaredrepogetter/layers/data/dto/home/permission.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/entities/home_entities/repository_response_entity_ob.dart';
import 'package:gitstaredrepogetter/layers/domain/entities/home/licence_entity.dart';
import 'package:gitstaredrepogetter/layers/domain/entities/home/owner_entity.dart';
import 'package:gitstaredrepogetter/layers/domain/entities/home/permission_entity.dart';
import 'package:gitstaredrepogetter/layers/domain/entities/home/repository_response_entity.dart';

class RepositoryResponseDto implements RepositoryResponseEntity {
  RepositoryResponseDto({
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

  factory RepositoryResponseDto.fromJson(Map<String, dynamic> json) =>
      RepositoryResponseDto(
        id: json["id"],
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        htmlUrl: json["html_url"],
        description: json["description"],
        url: json["url"],
        teamsUrl: json["teams_url"],
        languagesUrl: json["languages_url"],
        contributorsUrl: json["contributors_url"],
        subscribersUrl: json["subscribers_url"],
        subscriptionUrl: json["subscription_url"],
        commentsUrl: json["comments_url"],
        issuesUrl: json["issues_url"],
        pullsUrl: json["pulls_url"],
        labelsUrl: json["labels_url"],
        releasesUrl: json["releases_url"],
        deploymentsUrl: json["deployments_url"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        pushedAt: json["pushed_at"],
        gitUrl: json["git_url"],
        homepage: json["homepage"],
        size: json["size"],
        stargazersCount: json["stargazers_count"],
        watchersCount: json["watchers_count"],
        language: json["language"],
        hasDiscussions: json["has_discussions"],
        forksCount: json["forks_count"],
        archived: json["archived"],
        disabled: json["disabled"],
        openIssuesCount: json["open_issues_count"],
        license:
            json["license"] == null ? null : License.fromJson(json["license"]),
        topics: List<String>.from(json["topics"].map((x) => x)),
        visibility: json["visibility"],
        forks: json["forks"],
        openIssues: json["open_issues"],
        watchers: json["watchers"],
        defaultBranch: json["default_branch"],
        permissions: json["permissions"] == null
            ? null
            : RepoPermissions.fromJson(json["permissions"]),
        score: json["score"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "full_name": fullName,
        "private": private,
        "owner": owner?.toJson(),
        "html_url": htmlUrl,
        "description": description,
        "url": url,
        "teams_url": teamsUrl,
        "languages_url": languagesUrl,
        "contributors_url": contributorsUrl,
        "subscribers_url": subscribersUrl,
        "subscription_url": subscriptionUrl,
        "comments_url": commentsUrl,
        "issues_url": issuesUrl,
        "pulls_url": pullsUrl,
        "labels_url": labelsUrl,
        "releases_url": releasesUrl,
        "deployments_url": deploymentsUrl,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pushed_at": pushedAt,
        "git_url": gitUrl,
        "homepage": homepage,
        "size": size,
        "stargazers_count": stargazersCount,
        "watchers_count": watchersCount,
        "language": language,
        "has_discussions": hasDiscussions,
        "forks_count": forksCount,
        "archived": archived,
        "disabled": disabled,
        "open_issues_count": openIssuesCount,
        "license": license?.toJson(),
        "topics": List<dynamic>.from((topics ?? []).map((x) => x)),
        "visibility": visibility,
        "forks": forks,
        "open_issues": openIssues,
        "watchers": watchers,
        "default_branch": defaultBranch,
        "permissions": permissions?.toJson(),
        "score": score,
      };
  RepositoryResponseEntityOb get toRepositoryResponseEntityOb =>
      RepositoryResponseEntityOb.fromJson(toJson());

  @override
  bool? archived;

  @override
  String? commentsUrl;

  @override
  String? contributorsUrl;

  @override
  String? createdAt;

  @override
  String? defaultBranch;

  @override
  String? deploymentsUrl;

  @override
  String? description;

  @override
  bool? disabled;

  @override
  int? forks;

  @override
  int? forksCount;

  @override
  String? fullName;

  @override
  String? gitUrl;

  @override
  bool? hasDiscussions;

  @override
  String? homepage;

  @override
  String? htmlUrl;

  @override
  int id;

  @override
  String? issuesUrl;

  @override
  String? labelsUrl;

  @override
  String? language;

  @override
  String? languagesUrl;

  @override
  LicenseEntity? license;

  @override
  String? name;

  @override
  int? openIssues;

  @override
  int? openIssuesCount;

  @override
  OwnerEntity? owner;

  @override
  PermissionsEntity? permissions;

  @override
  bool? private;

  @override
  String? pullsUrl;

  @override
  String? pushedAt;

  @override
  String? releasesUrl;

  @override
  num? score;

  @override
  int? size;

  @override
  int? stargazersCount;

  @override
  String? subscribersUrl;

  @override
  String? subscriptionUrl;

  @override
  String? teamsUrl;

  @override
  List<String>? topics;

  @override
  String? updatedAt;

  @override
  String? url;

  @override
  String? visibility;

  @override
  int? watchers;

  @override
  int? watchersCount;
}
