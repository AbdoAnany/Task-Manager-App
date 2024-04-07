class  UserModel {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,

  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'avatar': avatar,
      'last_name': lastName,
    };
  }


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      avatar: json['avatar'],
      lastName: json['last_name'],
    );
  }

  @override
  String toString() {
    return 'TaskModel{id: $id, email: $email, first_name: $firstName, '
        'last_name: $lastName, avatar: $avatar}';
  }
}
