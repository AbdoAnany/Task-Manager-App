import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  late int page;
  @JsonKey(name: 'per_page')

  late int perPage;

  late int total;
  @JsonKey(name: 'total_pages')
  late int totalPages;
  late List<UserData> data;

  UserResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {

    print(json);
    return _$UserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class UserData {
  late int id;
  late String email;
  @JsonKey(name: 'first_name')

  late String firstName;
  @JsonKey(name: 'last_name')

  late String lastName;
  late String avatar;

  UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
