// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class DayEntity {
  int id = 0;

  @Property(type: PropertyType.date)
  DateTime date;

  double time;
  String comment;

  DayEntity({
    required this.date,
    required this.time,
    required this.comment,
  });
}
