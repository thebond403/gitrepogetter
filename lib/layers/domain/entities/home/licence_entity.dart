abstract class LicenseEntity {
  String? key;
  String? name;
  String? spdxId;
  String? url;
  String? nodeId;
  int id;

  LicenseEntity(
      {this.key, this.name, this.spdxId, this.url, this.nodeId, this.id = 0});

  Map<String, dynamic> toJson();
}
