import 'package:gitstaredrepogetter/app.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/boxes/base_box.dart';
import 'package:gitstaredrepogetter/layers/data/ob_box/entities/home_entities/last_fetch_time_entity_ob.dart';

// final lastFetchTimeEntityBoxProvider =
//     Provider((ref) => LastFetchTimeEntityBox(obStore));

// class LastFetchTimeEntityBox extends BaseBox<LastFetchTimeEntityOb> {
//   LastFetchTimeEntityBox(super.store);
// }
class LastFetchTimeEntityBox extends BaseBox<LastFetchTimeEntityOb> {

  factory LastFetchTimeEntityBox() {
    return _instance;
  }

  LastFetchTimeEntityBox._() : super(obStore);

  static LastFetchTimeEntityBox get _instance => LastFetchTimeEntityBox._();
}
