import 'package:objectbox/objectbox.dart';

class BaseBox<T> {
  final Store _store;

  BaseBox(this._store);

  Box<T> getBox() {
    return _store.box<T>();
  }

  int insert(T entity) {
    return _store.box<T>().put(
          entity,
          mode: PutMode.insert,
        );
  }

  Future<int> insertAsync(T entity) async {
    return await _store.box<T>().putAsync(
          entity,
          mode: PutMode.insert,
        );
  }

  List<int> insertMany(List<T> entities) {
    return _store.box<T>().putMany(
          entities,
          mode: PutMode.insert,
        );
  }

  Future<List<int>> insertManyAsync(List<T> entities) async {
    return await _store.box<T>().putManyAsync(
          entities,
          mode: PutMode.insert,
        );
  }

  Future<List<T>> insertAndGetManyAsync(List<T> entities) async {
    return await _store.box<T>().putAndGetManyAsync(
          entities,
          mode: PutMode.insert,
        );
  }

  List<T> getAll() {
    return _store.box<T>().getAll();
  }

  Future<List<T>> getAllAsync() async {
    return await _store.box<T>().getAllAsync();
  }

  T? getById(int id) {
    return _store.box<T>().get(id);
  }

  Future<T?> getByIdAsync(int id) async {
    return await _store.box<T>().getAsync(id);
  }

  int update(T entity) {
    return _store.box<T>().put(entity);
  }

  Future<int> updateAsync(T entity) async {
    return await _store.box<T>().putAsync(entity);
  }

  List<int> updateMany(List<T> entities) {
    return _store.box<T>().putMany(entities);
  }

  Future<List<int>> updateManyAsync(List<T> entities) async {
    return await _store.box<T>().putManyAsync(entities);
  }

  bool delete(int id) {
    return _store.box<T>().remove(id);
  }

  Future<bool> deleteAsync(int id) async {
    return await _store.box<T>().removeAsync(id);
  }

  int deleteMany(List<int> id) {
    return _store.box<T>().removeMany(id);
  }

  Future<int> deleteManyAsync(List<int> id) async {
    return await _store.box<T>().removeManyAsync(id);
  }

  QueryBuilder<T> query(Condition<T>? qc) {
    return _store.box<T>().query(qc);
  }
}
