import 'base_model.dart';

class AccountModel extends BaseModel {
  final String id;
  final String email;
  final String provider;
  final String accessToken;
  final String createAt;
  final String updateAt;

  AccountModel(
      {this.id,
      this.email,
      this.provider,
      this.accessToken,
      this.createAt,
      this.updateAt});

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
        id: json['id'],
        email: json['email'],
        provider: json['provider'],
        accessToken: json['accessToken'],
        createAt: json['createAt'],
        updateAt: json['updateAt']);
  }
}
