class Day {
  final DateTime? date;
  final int? day;

  double? iTime;
  double? fTime;

  Day({
    this.date,
    this.day,
    this.iTime,
    this.fTime,
  });

  static Day fromMap(Map day) {
    return Day(
      date: day['date'],
      day: day['day'],
      iTime: day['iTime'],
      fTime: day['fTime'],
    );
  }

  static Map toMap(Day day) {
    return {
      'date': day.date,
      'day': day.day,
      'iTime': day.iTime,
      'fTime': day.fTime,
    };
  }
}
