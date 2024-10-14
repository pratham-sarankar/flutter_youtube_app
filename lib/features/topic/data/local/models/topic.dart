class Topic {
  int? id;
  String name;
  bool isSelected;
  int precedence;

  Topic({
    this.id,
    required this.isSelected,
    required this.name,
    required this.precedence,
  });

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['id'],
      name: map['name'],
      precedence: map['precedence'],
      isSelected: map['isSelected'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'precedence': precedence,
      'isSelected': isSelected ? 1 : 0,
    };
  }

  Topic copyWith({
    String? name,
    int? precedence,
    bool? isSelected,
  }) {
    return Topic(
      id: id,
      name: name ?? this.name,
      precedence: precedence ?? this.precedence,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  static String get tableName => 'topics';

  static String get createSQL => """
    CREATE TABLE IF NOT EXISTS $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      precedence INTEGER NOT NULL,
      isSelected INTEGER NOT NULL DEFAULT 0
    );
  """;
}
