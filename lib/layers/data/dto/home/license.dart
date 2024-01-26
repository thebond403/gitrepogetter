import 'dart:convert';

import 'package:gitstaredrepogetter/layers/domain/entities/home/licence_entity.dart';
import 'package:objectbox/objectbox.dart';

class License implements LicenseEntity {
  License({
    this.name,
    this.key,
    this.spdxId,
    this.url,
    this.nodeId,
    this.id = 0
  });

  License copyWith({
    String? key,
    String? name,
    String? spdxId,
    String? url,
    String? nodeId,
  }) =>
      License(
        key: key ?? this.key,
        name: name ?? this.name,
        spdxId: spdxId ?? this.spdxId,
        url: url ?? this.url,
        nodeId: nodeId ?? this.nodeId,
      );

  factory License.fromJson(Map<String, dynamic> json) => License(
        key: json["key"],
        name: json["name"],
        spdxId: json["spdx_id"],
        url: json["url"],
        nodeId: json["node_id"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "spdx_id": spdxId,
        "url": url,
        "node_id": nodeId,
      };
  

  String get asString => jsonEncode(toJson());
      
  @override
  String? key;

  @override
  String? name;

  @override
  @Id()
  int id;
  
  @override
  String? nodeId;

  @override
  String? spdxId;

  @override
  String? url;
}
