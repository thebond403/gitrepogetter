import 'dart:developer';
import 'package:gitstaredrepogetter/app.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/boxes/base_box.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/entities/home_entities/repository_response_entity_ob.dart';


class RepositoryResponseEntityBox extends BaseBox<RepositoryResponseEntityOb> {
  factory RepositoryResponseEntityBox() {
    return _instance;
  }
  RepositoryResponseEntityBox._() : super(obStore) {
    log("Creating new instance of \"RepositoryResponseEntityBox\"");
  }
  // RepositoryResponseEntityBoxV2() : super(obStore);
  static RepositoryResponseEntityBox get _instance =>
      RepositoryResponseEntityBox._();
}
