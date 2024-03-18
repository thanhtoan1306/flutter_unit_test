import 'package:flutter/foundation.dart';
import 'package:research_flutter_unit_test/data/api/rest_api.dart';
import 'package:research_flutter_unit_test/data/models/account.dart';
import 'package:research_flutter_unit_test/data/models/base_response.dart';
import 'package:research_flutter_unit_test/data/services/base_service.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:research_flutter_unit_test/data/repositories/account/account_repository.dart';

class MockBaseService extends Mock implements BaseService {}

class MockRestAPI extends Mock implements RestAPI {}

void main() {
  group('AccountRepository', () {
    late AccountRepository accountRepository;
    late MockBaseService mockBaseService;
    late MockRestAPI mockRestAPI;

    setUp(() {
      mockBaseService = MockBaseService();
      mockRestAPI = MockRestAPI();
      when(() => mockBaseService.client).thenReturn(mockRestAPI);
      accountRepository = AccountRepository(api: mockBaseService);
    });

    group("API loginWithPhone", () {
      test('loginWithPhone should return Account instance when data correct', () async {
        // Arrange
        String phone = "0920920920";
        String tokenDevice = "zHHqZE4dfFBI5i4hur0sbRrTwYA6EUWZTSOZYQWZIWuoDJIFAxSlzXSw4Z3679c8";
        Map<String, dynamic> body = {
          "phone_number": phone,
          "device_token": tokenDevice,
        };

        // Stubbing the loginWithPhone method of mockRestAPI
        when(() => mockRestAPI.loginWithPhone(body)).thenAnswer((_) async => BaseResponse(code: 200, results: {
              "object": {
                "id": "5d2f7e60-b02b-11ee-9eb2-39fb5e7de749",
                "email": "minhan@gmail.com",
                "full_name": "Minh An",
                "phone_number": "0930930930",
              }
            }));

        // Act
        final result = await accountRepository.loginWithPhone(phone, tokenDevice);

        // Assert
        expect(result, isA<Account>());
      });

      test('loginWithPhone should throw an exception when the loginWithPhone method throws an exception', () async {
        // Arrange
        String phone = "0920920920";
        String tokenDevice = "zHHqZE4dfFBI5i4hur0sbRrTwYA6EUWZTSOZYQWZIWuoDJIFAxSlzXSw4Z3679c8";
        Map<String, dynamic> body = {
          "phone_number": phone,
          "device_token": tokenDevice,
        };

        // Stubbing the loginWithPhone method of mockRestAPI
        when(() => mockRestAPI.loginWithPhone(body)).thenThrow(Exception('Login with phone failed'));

        // Act
        Future<Account?> call = accountRepository.loginWithPhone(phone, tokenDevice);

        // Assert
        expect(call, throwsA(isA<FlutterError>().having((e) => e.message, 'error message', 'Login with phone failed')));
      });
    });

    group("API loginWithEmail", () {
      test('loginWithEmail should return Account instance when email & password correct', () async {
        // Arrange
        String email = "flutter_test@gmail.com";
        String password = "123456789";

        Map<String, dynamic> body = {
          "id": email,
          "password": password,
        };

        // Stubbing the loginWithEmail method of mockRestAPI
        when(() => mockRestAPI.loginWithEmail(body)).thenAnswer((_) async => BaseResponse(code: 200, results: {
              "object": {
                "id": "74847ce0-e4d9-11ee-92d5-e954923e80f9",
                "email": "flutter_test@gmail.com",
                "phone_number": "0997654321",
              }
            }));

        // Act
        final result = await accountRepository.loginWithEmail(email, password);

        // Assert
        expect(result, isA<Account>());
      });

      test('loginWithEmail should return error text "Mật khẩu không chính xác" when ', () async {
        // Arrange
        String email = "flutter_test@gmail.com";
        String password = "incorrect_password";

        Map<String, dynamic> body = {
          "id": email,
          "password": password,
        };

        const String errorMessage = "Mật khẩu không chính xác";

        // Stubbing the loginWithEmail method of mockRestAPI
        when(() => mockRestAPI.loginWithEmail(body)).thenAnswer((_) async => BaseResponse(code: 401, results: {
              "object": {
                "code": 401,
                "type": "auth_exception_password_incorrect",
                "message": errorMessage,
              }
            }));

        // Act
        Future<Account?> call = accountRepository.loginWithEmail(email, password);

        expect(call, throwsA(predicate((e) => e is FlutterError && e.message == errorMessage)));
      });
    });
  });
}
