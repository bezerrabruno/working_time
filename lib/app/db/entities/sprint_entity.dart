import 'package:objectbox/objectbox.dart';

@Entity()
class SprintEntity {
  int id = 0;

  String name;

  @Property(type: PropertyType.date)
  DateTime initialDate;

  @Property(type: PropertyType.date)
  DateTime finalDate;

  SprintEntity({
    required this.name,
    required this.initialDate,
    required this.finalDate,
  });
}
