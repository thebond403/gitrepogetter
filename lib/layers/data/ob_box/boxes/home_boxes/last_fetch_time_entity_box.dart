import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gitstaredrepogetter/app.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/boxes/base_box.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/entities/home_entities/last_fetch_time_entity_ob.dart';

final lastFetchTimeEntityBoxProvider =
    Provider((ref) => LastFetchTimeEntityBox(obStore));

class LastFetchTimeEntityBox extends BaseBox<LastFetchTimeEntityOb> {
  LastFetchTimeEntityBox(super.store);
}
