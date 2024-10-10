class Topic {
  int? id;
  String name;
  int precedence;

  Topic({
    this.id,
    required this.name,
    required this.precedence,
  });

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['id'],
      name: map['name'],
      precedence: map['precedence'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'precedence': precedence,
    };
  }

  Topic copyWith({
    String? name,
    int? precedence,
  }) {
    return Topic(
      id: id,
      name: name ?? this.name,
      precedence: precedence ?? this.precedence,
    );
  }

  static String get tableName => 'topics';

  static String get createSQL => """
    CREATE TABLE IF NOT EXISTS $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      precedence INTEGER NOT NULL
    );
  """;
}
