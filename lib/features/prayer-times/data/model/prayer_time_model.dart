class Place {
  final String country;
  final String name;
  final String stateName;

  Place({
    required this.country,
    required this.name,
    required this.stateName,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      country: json['country'] ?? "",
      name: json['name'] ?? "",
      stateName: json['stateName'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'name': name,
      'stateName': stateName,
    };
  }
}


class PrayerDay {
  final DateTime date;
  final List<String> times;

  PrayerDay({
    required this.date,
    required this.times,
  });

  factory PrayerDay.fromJson(String dateKey, List<dynamic> values) {
    return PrayerDay(
      date: DateTime.parse(dateKey),
      times: values.map((v) => v.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'times': times,
    };
  }
}


class PrayerTimesResponse {
  final Place place;
  final List<PrayerDay> days;

  PrayerTimesResponse({required this.place, required this.days});

  factory PrayerTimesResponse.fromJson(Map<String, dynamic> json) {
    final place = Place.fromJson(json['place']);
    final times = json['times'] as Map<String, dynamic>;

    final days = times.entries
        .map((e) => PrayerDay.fromJson(e.key, e.value))
        .toList();

    return PrayerTimesResponse(place: place, days: days);
  }

  Map<String, dynamic> toJson() {
    final timesMap = <String, dynamic>{};
    for (var day in days) {
      timesMap[day.date.toIso8601String()] = day.times;
    }
    return {
      'place': place.toJson(),
      'times': timesMap,
    };
  }
}



extension PrayerDayExtension on PrayerDay {
  String getUpcomingPrayer() {
    final now = DateTime.now();

    final prayerLabels = ["İmsak", "Güneş", "Öğle", "İkindi", "Akşam", "Yatsı"];

    for (int i = 0; i < times.length; i++) {
      final timeParts = times[i].split(":");
      if (timeParts.length != 2) continue;

      final prayerTime = DateTime(
        date.year,
        date.month,
        date.day,
        int.parse(timeParts[0]),
        int.parse(timeParts[1]),
      );

      if (prayerTime.isAfter(now)) {
        return prayerLabels[i];
      }
    }
    return prayerLabels.last;
  }
}

