import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:research_flutter_unit_test/data/models/account.dart';
import 'package:research_flutter_unit_test/data/repositories/account/iaccount_repository.dart';
import 'package:research_flutter_unit_test/modules/login/login_controller.dart';

class MockAccountRepository extends Mock implements IAccountRepository {}

void main() {
  late MockAccountRepository mockAccountRepository;
  late LoginController loginController;

  setUp(() {
    mockAccountRepository = MockAccountRepository();
    loginController = LoginController(
      accountRepository: mockAccountRepository,
    );
  });
  group("login", () {
    test("login should return false when the phone is empty", () async {
      // Arrange
      loginController.putToPhoneController("");

      // Act
      bool result = await loginController.login();

      // Assert
      expect(result, false);
    });

    test("login should return false when the phone is invalid", () async {
      // Arrange
      loginController.putToPhoneController("123");

      // Act
      bool result = await loginController.login();

      // Assert
      expect(result, false);
    });

    test("login should return true when the phone is valid", () async {
      //Arrange
      loginController.putToPhoneController("0987654321");
      String phone = loginController.phoneController.text;
      String tokenDevice = "zHHqZE4dfFBI5i4hur0sbRrTwYA6EUWZTSOZYQWZIWuoDJIFAxSlzXSw4Z3679c8";
      //Stubing
      when(() => mockAccountRepository.loginWithPhone(phone, tokenDevice)).thenAnswer((_) async {
        return Account(
          avatar: "https://dev-server.miha.vn/images/0b1b6426-41d7-4677-a8da-48fa1a04c08d.png",
          email: "minhan@gmail.com",
          fullname: "Minh An",
          phone: "0930930930",
        );
      });

      //Act
      bool result = await loginController.login();
      //Assert
      expect(result, true);
    });
  });
}
