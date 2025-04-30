class Event {
  final String id;
  final String name;
  final DateTime date;
  final double lat;
  final double long;
  final String urlImage;

  Event({
    required this.id,
    required this.name,
    required this.date,
    required this.lat,
    required this.long,
    required this.urlImage,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as String,
      name: map['name'] as String,
      date: DateTime.parse(map['date'] as String),
      lat: map['lat'] as double,
      long: map['long'] as double,
      urlImage: map['urlImage'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date.toIso8601String(),
      'lat': lat,
      'long': long,
      'urlImage': urlImage,
    };
  }

  Event copyWith({
    String? id,
    String? name,
    DateTime? date,
    double? lat,
    double? long,
    String? urlImage,
  }) {
    return Event(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      urlImage: urlImage ?? this.urlImage,
    );
  }
}
