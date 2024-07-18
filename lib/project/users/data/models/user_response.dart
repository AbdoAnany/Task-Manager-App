import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
   int? page;
  @JsonKey(name: 'per_page')
   int? perPage;
   int? total;
   int? limit;
   int? skip;

  @JsonKey(name: 'total_pages')
   int? totalPages;
   @JsonKey(name: 'users')
   List<UserData>? data;

  UserResponse({
     this.page,
     this.perPage,
     this.total,
     this.totalPages,
     this.data,
     this.skip=0,
     this.limit=10,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {

    print(json);
    return _$UserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class UserData {
  late int? id;
  late String? email;
  @JsonKey(name: 'firstName')

  late String? firstName;
  @JsonKey(name: 'lastName')

  late String? lastName;
  @JsonKey(name: 'image')
  late String? avatar;

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
