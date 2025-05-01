class Event {
  final int id;
  final String name;
  final String description;
  final DateTime date;
  final double lat;
  final double long;
  final String urlImage;
  final String category;
  bool isFavorite;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.lat,
    required this.long,
    required this.urlImage,
    required this.category,
    required this.isFavorite,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      date: DateTime.parse(map['date'] as String),
      lat: map['lat'] as double,
      long: map['long'] as double,
      urlImage: map['urlImage'] as String,
      category: map['category'] as String,
      isFavorite: map['isFavorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date.toIso8601String(),
      'lat': lat.toString(),
      'long': long.toString(),
      'urlImage': urlImage,
      'category': category,
    };
  }

  Event copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? date,
    double? lat,
    double? long,
    String? urlImage,
    String? category,
  }) {
    return Event(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      date: date ?? this.date,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      urlImage: urlImage ?? this.urlImage,
      category: category ?? this.category,
      isFavorite: isFavorite,
    );
  }
}
