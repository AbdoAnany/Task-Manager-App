
import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody{
  final String username;
  final String password;
  final int expiresInMins;

  LoginRequestBody({required this.username, required this.password,this.expiresInMins=30});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}