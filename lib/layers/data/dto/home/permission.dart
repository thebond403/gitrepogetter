import 'dart:convert';
import 'package:gitstaredrepogetter/layers/domain/entities/home/permission_entity.dart';
import 'package:objectbox/objectbox.dart';
class RepoPermissions implements PermissionsEntity {
  RepoPermissions({
    this.admin,
    this.maintain,
    this.push,
    this.triage,
    this.pull,
    this.id = 0,
  });

  RepoPermissions copyWith({
    bool? admin,
    bool? maintain,
    bool? push,
    bool? triage,
    bool? pull,
  }) =>
      RepoPermissions(
        admin: admin ?? this.admin,
        maintain: maintain ?? this.maintain,
        push: push ?? this.push,
        triage: triage ?? this.triage,
        pull: pull ?? this.pull,
      );

  factory RepoPermissions.fromJson(Map<String, dynamic> json) =>
      RepoPermissions(
        admin: json["admin"],
        maintain: json["maintain"],
        push: json["push"],
        triage: json["triage"],
        pull: json["pull"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "admin": admin,
        "maintain": maintain,
        "push": push,
        "triage": triage,
        "pull": pull,
      };
  String get asString => jsonEncode(toJson());
      
  @override
  bool? admin;

  @override
  bool? maintain;

  @override
  bool? pull;

  @override
  bool? push;

  @override
  bool? triage;

  @override
  @Id()
  int id;
}
