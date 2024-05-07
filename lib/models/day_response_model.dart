class DayResponse {
  final int month;
  final int year;
  final List<Day> days;

  DayResponse({
    required this.month,
    required this.year,
    required this.days,
  });

  factory DayResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> days = json['days'];
    return DayResponse(
      month: int.parse(json['month']),
      year: json['year'],
      days: days.map((day) => Day.fromJson(day)).toList(),
    );
  }
}

class Day {
  final int day;
  final int type;

  Day({
    required this.day,
    required this.type,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      day: json['day'],
      type: json['type'],
    );
  }

  // empty day
  static Day empty() {
    return Day(day: 0, type: 0);
  }
}
