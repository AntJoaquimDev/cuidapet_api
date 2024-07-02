import 'dart:convert';

class Category {
  final int? id;
  final String? name;
  final String? type;

  Category({
    this.id,
    this.name,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt(),
      name: map['name'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));
}
