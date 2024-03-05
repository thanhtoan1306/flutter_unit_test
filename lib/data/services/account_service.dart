import 'package:get/get.dart';
import 'package:research_flutter_unit_test/data/models/account.dart';

class AccountService extends GetxService {
  var me = Rx<Account?>(null);
  Account? get myAccount => me.value;
}
