import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Information {
  Information({
    this.image,
    required this.title,
    required this.description,
    required this.name,
    required this.datetime,
    required this.phonenumber,
    required this.address,
  });
  final List<String>? image;
  final String title;
  final String description;
  final String name;
  final String datetime;
  final String phonenumber;
  final String address;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'description': description,
      'name': name,
      'datetime': datetime,
      'phonenumber': phonenumber,
      'address': address,
    };
  }

  factory Information.fromMap(Map<String, dynamic> map) {
    return Information(
      image: List<String>.from(map['image']),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      name: map['name'] ?? '',
      datetime: map['datetime'] ?? '',
      phonenumber: map['phonenumber'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Information.fromJson(String source) =>
      Information.fromMap(json.decode(source) as Map<String, dynamic>);
}
