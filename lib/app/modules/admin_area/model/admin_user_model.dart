import 'dart:convert';

class AdminUserModel {
  final String? uid;
  final String userUID;
  final String email;
  final String password;

  AdminUserModel({
    this.uid,
    required this.userUID,
    required this.email,
    required this.password,
  });

  AdminUserModel copyWith({
    String? uid,
    String? userUID,
    String? email,
    String? password,
  }) {
    return AdminUserModel(
      uid: uid ?? this.uid,
      userUID: userUID ?? this.userUID,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'userUID': userUID,
      'email': email,
      'password': password,
    };
  }

  factory AdminUserModel.fromMap(Map<String, dynamic> map) {
    return AdminUserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      userUID: map['userUID'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminUserModel.fromJson(String source) =>
      AdminUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdminUserModel(uid: $uid, userUID: $userUID, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant AdminUserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.userUID == userUID &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ userUID.hashCode ^ email.hashCode ^ password.hashCode;
  }
}
