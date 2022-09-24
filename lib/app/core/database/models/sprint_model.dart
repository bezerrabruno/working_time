import 'package:objectbox/objectbox.dart';

@Entity()
class SprintModel {
  int id;
  int iDay;
  int fDay;
  String? name;
  List<String>? days;

  SprintModel({
    this.id = 0,
    required this.iDay,
    required this.fDay,
    this.name,
    this.days,
  }) {
    setDefaultValues();
  }

  setDefaultValues() {
    name ??= 'Sprint $id';
    days ??= [];
  }
}
