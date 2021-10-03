import 'dart:convert';

class UserModel {
  final String userId;
  final String userEmail;
  final String userName;
  final bool isDriver;
  UserModel({
    required this.userId,
    required this.userEmail,
    required this.userName,
    required this.isDriver,
  });

  UserModel copyWith({
    String? userId,
    String? userEmail,
    String? userName,
    bool? isDriver,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
      isDriver: isDriver ?? this.isDriver,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userEmail': userEmail,
      'userName': userName,
      'isDriver': isDriver,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      userEmail: map['userEmail'],
      userName: map['userName'],
      isDriver: map['isDriver'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(userId: $userId, userEmail: $userEmail, userName: $userName, isDriver: $isDriver)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.userId == userId &&
        other.userEmail == userEmail &&
        other.userName == userName &&
        other.isDriver == isDriver;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        userEmail.hashCode ^
        userName.hashCode ^
        isDriver.hashCode;
  }
}
