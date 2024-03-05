import 'package:flutter/foundation.dart';
import 'package:research_flutter_unit_test/data/models/account.dart';
import 'package:research_flutter_unit_test/data/repositories/account/iaccount_repository.dart';
import 'package:research_flutter_unit_test/data/services/base_service.dart';

class AccountRepository extends IAccountRepository {
  AccountRepository({
    required BaseService api,
  }) : _api = api;
  final BaseService _api;

  @override
  Future<Account?> loginWithPhone(String phone, String token) async {
    try {
      Map<String, dynamic> body = {
        "phone_number": phone,
        "device_token": token,
      };
      var response = await _api.client.loginWithPhone(body);
      final account = response.parse((map) => Account.fromJson(map));
      return account;
    } catch (err) {
      throw FlutterError('Login with phone failed');
    }
  }
}
