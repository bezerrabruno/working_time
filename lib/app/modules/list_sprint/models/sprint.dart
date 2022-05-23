class Sprint {
  final int id;
  final String name;
  final int iDay;
  final int fDay;

  Sprint({
    required this.id,
    required this.name,
    required this.iDay,
    required this.fDay,
  });

  static List<Sprint> fromMap(List map) {
    final List<Sprint> sprints = [];

    for (Map row in map) {
      final sprint = Sprint(
        id: row['id'],
        name: row['name'],
        iDay: row['iDay'],
        fDay: row['fDay'],
      );

      sprints.add(sprint);
    }
    return sprints;
  }
}
