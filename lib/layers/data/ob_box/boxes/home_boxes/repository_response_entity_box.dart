import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gitstaredrepogetter/app.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/boxes/base_box.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/entities/home_entities/repository_response_entity_ob.dart';

final repositoryEntityBoxProvider =
    Provider((ref) => RepositoryResponseEntityBox(obStore));

class RepositoryResponseEntityBox extends BaseBox<RepositoryResponseEntityOb> {
  RepositoryResponseEntityBox(super.store);
}
