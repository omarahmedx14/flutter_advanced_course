import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  String? email;
  String? password;

  LoginRequestBody({this.email, this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
