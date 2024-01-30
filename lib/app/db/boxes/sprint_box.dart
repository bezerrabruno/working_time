import 'package:working_time/app/db/box_db/object_box.dart';
import 'package:working_time/app/db/boxes/box_adapter.dart';
import 'package:working_time/app/db/entities/sprint_entity.dart';

class SprintBox implements BoxAdapter {
  late final ObjectBox _objectBox;

  SprintBox(this._objectBox);

  @override
  Future get(param) async {
    param as int;

    final store = await _objectBox.getStore();
    final box = store.box<SprintEntity>();

    return box.get(param);
  }

  @override
  Future<List<SprintEntity>> getAll() async {
    final store = await _objectBox.getStore();
    final box = store.box<SprintEntity>();

    return box.getAll();
  }

  @override
  Future<void> update(entity) async {
    entity as SprintEntity;

    final store = await _objectBox.getStore();
    final box = store.box<SprintEntity>();

    box.put(entity);
  }

  @override
  Future<void> delete(int id) async {
    final store = await _objectBox.getStore();
    final box = store.box<SprintEntity>();

    box.remove(id);
  }

  @override
  Future<void> clear() async {
    final store = await _objectBox.getStore();
    final box = store.box<SprintEntity>();

    box.removeAll();
  }
}
