import 'package:cloud_firestore/cloud_firestore.dart';

class Report {
  String? firstname;
  String? lastname;
  String? nickname;
  int? age;
  String? gender;
  List<dynamic>? syntoms;
  Timestamp? createdAt;

  // constructure
  Report({
    this.firstname,
    this.lastname,
    this.nickname,
    this.age,
    this.gender,
    this.syntoms = const [],
    this.createdAt
  });

  factory Report.fromJson(Map<String, dynamic>? json) {
    return Report(
      firstname: json?['fitstname'],
      lastname: json?['lastname'],
      nickname: json?['nickname'],
      age: json?['age'],
      gender: json?['gener'],
      syntoms: json?['syntoms'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['fitstname'] = firstname;
    _data['lastname'] = lastname;
    _data['nickname'] = nickname;
    _data['age'] = age;
    _data['gener'] = gender;
    _data['syntoms'] = syntoms;
    _data['creadted_at'] = Timestamp.now();

    return _data;
  }
}
