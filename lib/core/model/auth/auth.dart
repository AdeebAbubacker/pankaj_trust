import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth {
	User? user;
	@JsonKey(name: 'access_token') 
	String? accessToken;

	Auth({this.user, this.accessToken});

	factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

	Map<String, dynamic> toJson() => _$AuthToJson(this);
}
