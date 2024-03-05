import 'package:research_flutter_unit_test/data/models/account.dart';
import 'package:research_flutter_unit_test/data/repositories/ibase_repository.dart';

abstract class IAccountRepository extends IBaseRepository {
  Future<Account?> loginWithPhone(String phone, String token);
}
