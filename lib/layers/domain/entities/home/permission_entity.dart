abstract class PermissionsEntity {
  bool? admin;
  bool? maintain;
  bool? push;
  bool? triage;
  bool? pull;
  int id;

  PermissionsEntity({
    this.admin,
    this.maintain,
    this.push,
    this.triage,
    this.pull,
      this.id = 0
  });
  
  Map<String, dynamic> toJson();
}
