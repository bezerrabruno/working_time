import 'package:objectbox/objectbox.dart';

import 'models/sprint_model.dart';
import 'objectbox.g.dart';

class ObjectBox {
  Store? _store;

  Future<void> initStore() async {
    _store = await openStore();
  }

  Future<Store> getStore() async {
    _store ?? await initStore();

    return _store!;
  }

  Future<Box<SprintModel>> getSprints() async {
    _store ?? await initStore();

    return _store!.box<SprintModel>();
  }
}
