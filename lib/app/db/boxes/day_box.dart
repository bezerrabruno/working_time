import 'package:working_time/app/db/box_db/object_box.dart';
import 'package:working_time/app/db/box_db/objectbox.g.dart';
import 'package:working_time/app/db/boxes/box_adapter.dart';
import 'package:working_time/app/db/entities/day_entity.dart';

class DayBox implements BoxAdapter {
  late final ObjectBox _objectBox;

  DayBox(this._objectBox);

  @override
  Future get(param) async {
    param as int;

    final store = await _objectBox.getStore();
    final box = store.box<DayEntity>();

    DayEntity_.date.toString();

    final query = box.query(DayEntity_.date.equals(param)).build();

    final day = query.find();
    query.close();

    return day.isNotEmpty ? day.first : null;
  }

  @override
  Future<List<DayEntity>> getAll() async {
    final store = await _objectBox.getStore();
    final box = store.box<DayEntity>();

    return box.getAll();
  }

  @override
  Future<void> update(entity) async {
    entity as DayEntity;

    final store = await _objectBox.getStore();
    final box = store.box<DayEntity>();

    box.put(entity);
  }

  @override
  Future<void> delete(int id) async {
    final store = await _objectBox.getStore();
    final box = store.box<DayEntity>();

    box.remove(id);
  }

  @override
  Future<void> clear() async {
    final store = await _objectBox.getStore();
    final box = store.box<DayEntity>();

    box.removeAll();
  }
}
