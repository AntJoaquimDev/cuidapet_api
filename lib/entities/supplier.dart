import 'dart:convert';

import 'package:cuidapet_api/entities/catogory.dart';

class Supplier {
  final int? id;
  final String? name;
  final String? logo;
  final String? address;
  final String? phone;
  final double? lat;
  final double? lng;
  final Category? category;

  Supplier({
    this.id,
    this.name,
    this.logo,
    this.address,
    this.phone,
    this.lat,
    this.lng,
    this.category,
  });

  Supplier copyWith({
    int? id,
    String? name,
    String? logo,
    String? address,
    String? phone,
    double? lat,
    double? lng,
    Category? category,
  }) {
    return Supplier(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'address': address,
      'phone': phone,
      'lat': lat,
      'lng': lng,
      'category': category?.toMap(),
    };
  }

  factory Supplier.fromMap(Map<String, dynamic> map) {
    return Supplier(
      id: map['id']?.toInt(),
      name: map['name'],
      logo: map['logo'],
      address: map['address'],
      phone: map['phone'],
      lat: map['lat']?.toDouble(),
      lng: map['lng']?.toDouble(),
      category: map['category'] != null ? Category.fromMap(map['category']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Supplier.fromJson(String source) => Supplier.fromMap(json.decode(source));
}
