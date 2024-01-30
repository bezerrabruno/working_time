abstract class BoxAdapter {
  Future get(dynamic param);

  Future<List> getAll();

  Future<void> update(dynamic entity);

  Future<void> delete(int id);

  Future<void> clear();
}
