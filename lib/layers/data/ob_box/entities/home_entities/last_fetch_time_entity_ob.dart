import 'package:objectbox/objectbox.dart';

@Entity()
class LastFetchTimeEntityOb {
  LastFetchTimeEntityOb({this.id = 0, this.lastFetchTime});
  @Id()
  int id;

  @Property(type: PropertyType.date)
  DateTime? lastFetchTime;
}
