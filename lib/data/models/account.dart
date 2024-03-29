import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String? fullname;
  final String? phone;
  final String? email;
  final String? avatar;
  Account({
    this.fullname,
    this.phone,
    this.email,
    this.avatar,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
