import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '/app/core/database/db.dart';
import '/app/core/database/models/sprint_model.dart';
import '/app/core/utils/page_state.dart';

part 'sprints_store.g.dart';

class SprintsStore = SprintsStoreBase with _$SprintsStore;

abstract class SprintsStoreBase with Store {
  final box = Modular.get<ObjectBox>();

  @observable
  PageState state = PageState.load;

  List<SprintModel> sprints = [];

  SprintsStoreBase() {
    loadSprints();
  }

  @action
  Future<void> loadSprints() async {
    state = PageState.load;

    try {
      final result = await box.getSprints();
      sprints = result.getAll();

      if (sprints.isEmpty) {
        state = PageState.empty;
        return;
      }

      state = PageState.success;
    } catch (e) {
      state = PageState.error;
    }
  }

  @action
  Future<void> saveSprint() async {
    Modular.to.pop();

    state = PageState.load;

    try {
      final result = await box.getSprints();
      result.put(SprintModel(iDay: 1, fDay: 15));

      await loadSprints();
    } catch (e) {
      state = PageState.error;
    }
  }
}
