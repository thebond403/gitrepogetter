import 'dart:convert';
import 'package:gitstaredrepogetter/layers/data/dto/home/repository_response_dto.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class RepositoryResponseEntityOb {
  RepositoryResponseEntityOb({
    // this.entityId = 0,
    this.id = 0,
    this.name,
    this.fullName,
    this.private,
    required this.owner,
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
    required this.license,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    required this.permissions,
    this.score,
  });

  factory RepositoryResponseEntityOb.fromJson(Map<String, dynamic> json) =>
      RepositoryResponseEntityOb(
        id: json["id"],
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
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
        topics: List<String>.from(json["topics"].map((x) => x)),
        visibility: json["visibility"],
        forks: json["forks"],
        openIssues: json["open_issues"],
        watchers: json["watchers"],
        defaultBranch: json["default_branch"],
        owner: jsonEncode(json['owner']),
        license: jsonEncode(json['license']),
        permissions: jsonEncode(json['permissions']),
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "full_name": fullName,
        "private": private,
        "owner": jsonDecode(owner ?? ""),
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
        "license": jsonDecode(license ?? ""),
        "topics": List<dynamic>.from((topics ?? []).map((x) => x)),
        "visibility": visibility,
        "forks": forks,
        "open_issues": openIssues,
        "watchers": watchers,
        "default_branch": defaultBranch,
        "permissions": jsonDecode(permissions ?? ""),
        "score": score,
      };

  RepositoryResponseDto get toRepositoryResponseDto =>
      RepositoryResponseDto.fromJson(toJson());

  // @Id()
  // int entityId;

  bool? archived;

  String? commentsUrl;

  String? contributorsUrl;

  String? createdAt;

  String? defaultBranch;

  String? deploymentsUrl;

  String? description;

  bool? disabled;

  int? forks;

  int? forksCount;

  String? fullName;

  String? gitUrl;

  bool? hasDiscussions;

  String? homepage;

  String? htmlUrl;

  @Id(assignable: true)
  int id;

  String? issuesUrl;

  String? labelsUrl;

  String? language;

  String? languagesUrl;

  String? license;

  String? name;

  int? openIssues;

  int? openIssuesCount;

  String? owner;

  String? permissions;

  bool? private;

  String? pullsUrl;

  String? pushedAt;

  String? releasesUrl;

  num? score;

  int? size;

  int? stargazersCount;

  String? subscribersUrl;

  String? subscriptionUrl;

  String? teamsUrl;

  List<String>? topics;

  String? updatedAt;

  String? url;

  String? visibility;

  int? watchers;

  int? watchersCount;
}
