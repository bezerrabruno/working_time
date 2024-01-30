import 'package:path_provider/path_provider.dart';
import 'package:working_time/app/db/box_db/objectbox.g.dart';

/// Instancia global do [ObjectBox]
late final ObjectBox appBox;

/// Classe [ObjectBox] responsavel por armazenar dados da aplicação
class ObjectBox {
  Store? store;

  Future<void> _initStore() async {
    final directory = await getApplicationDocumentsDirectory();

    if (Store.isOpen(directory.path)) {
      store = Store.attach(getObjectBoxModel(), directory.path);
    } else {
      store = await openStore(directory: directory.path);
    }
  }

  Future<Store> getStore() async {
    if (store == null || store!.isClosed()) {
      await _initStore();
    }

    return store!;
  }
}
