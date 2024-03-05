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

    test('loginWithPhone should return Account instance', () async {
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
              "bio": null,
              "sex": "FEMALE",
              "username": null,
              "email": "minhan@gmail.com",
              "password": null,
              "full_name": "Minh An",
              "phone_number": "0930930930",
              "avatar_url": "https://dev-server.miha.vn/images/0b1b6426-41d7-4677-a8da-48fa1a04c08d.png",
              "role": "COACH",
              "date_of_birth": "2007-12-31T17:00:00.000Z",
              "google_link": null,
              "facebook_link": null,
              "apple_link": null,
              "is_coacher": true,
              "is_collaborator": false,
              "is_account_verified": true,
              "account_verify_status": "APPROVED",
              "instances_id": [
                "dHQM59c3xYTnEWb2IGu4TB:APA91bHyymhV3UrUEZ_xX9WPo7J1Kit7Sy2A5H3hAC9VNQueITjmFY2Bz4COwu0S9x5a8cpUOM_Zh7zlBvUvMiG74JRBZTzDjE1pC6YhSM2cxRarVbZKBn3iKsgQK2is4zBEIe4ArJiP",
                "eJaeUpLrtTHEl3YUaURS2m:APA91bH9EfwNzHtalJvL_Yky-fNK4TP8yT4nuI-3X5fx1WCDS00L2rY-0z8v8Bd-JvWiNU6rgKYRTQb63JfJPJ2aLehOqPIspbHLKIjWjz0_-Kf9MvinydHmf1o9DPlWTOnzyCLrZCrq",
                "eBrtML4ctk7gOuSUlz9BNa:APA91bHkTSDR5hcoiZ42NvpIUqocs6CTXe66RhxCV4qJUYy9A8nWQPdSstsaZH1Qo4xDFGuY-zNcTX4xnrRK9YEovrLL_9i8CvxtmbTaxpizpPbBhhsgBc65C6SljkUyDVeKCUc5BzyJ",
                "token_device_test",
                "fU9lWd9W-jGCO93Lg0Q_ju:APA91bGU75lL_7i2j4HJAql8WKuzuhlIQ6KDYryGrD3T051rk64ha34R5WF-3iCzHGK8CcAcqMiN8S2aukG5ukfVAWpoFGOWm6k08mPSY5_hELYtiIqaPpDx_8C6lS1F6FDpTBtetpxa",
                "fV6gyop5rLfHY4BjROaTE_:APA91bG61ele1JqGLYltYlI-3mIHxly6osh3RuQkYuFOevcvqSRztzkfp-U49TzkHAz-COFZuhsFSSXU1YgDCFyuLjPGgk1Hv3uiyZYgjfT25cx3kL0lorOzEO9kziO837POaD763mK6",
                "dQg91iNQBYMEvBz92aWJ-C:APA91bFaOWb4QF3nIy6FvxKTLsSO65oOYdZq-bZdcxC0Yp9bPZJCS2wo6LplMtd3uiKVIX0uJohLUtXc8NdoprxvK_vtp7vaxDCQNaGoUYkNWH436fCFY0Khq2F8jc8CQc-44UCLnb8E",
                "dohqLNZcJgtvWN46RXF-dw:APA91bFI9ylcmSJ0_v-ZI66unfWKbhGjGFlYlncA0mstQ08Xk6_3X4728HwkScpyJ5Oqgby_o140NsgDl6zRBxzRPz9jMGN1bXxyGt02uEn9rpep2-60mxo_JUE4MCbqLW3mRq8PAfTv",
                "fAKShAawB2NXoI8Y0gkD6i:APA91bEevArn37XZE88nW3x-rCXOtC9oQ5NSZHlPZDzKYCaPbLIDeUhe3-0YPIEqYzsCf_-nKqKink2RCjB_FsCheNLgYscIiAJb2rqNoKP1lMZfN61dVjgJdUKO1UgglFIQ1G_CVpKa"
              ],
              "user_type": "DEFAULT",
              "invited_by": "cd14d210-a947-11ee-8636-43a3b4e57709",
              "status": "ACTIVE",
              "coach_id": "0c8619f0-ab81-11ee-80e7-135e14fc31f6",
              "invited_at": null,
              "choose_coach_at": null,
              "created_at_unix_timestamp": "1704941078856",
              "created_at": "2024-01-11T02:44:38.946Z",
              "updated_at": "2024-01-23T13:42:46.233Z",
              "deleted_at": null,
              "coacher": {
                "avatar_url": "https://dev-server.miha.vn/images/22d61dc6-aa85-475b-b1f1-8ff657ad8144.jpg",
                "id": "0c8619f0-ab81-11ee-80e7-135e14fc31f6",
                "bio": "",
                "sex": "FEMALE",
                "username": null,
                "email": "tramle14321@mailinator.com",
                "full_name": "TEST COACHER TRAM 1",
                "phone_number": "0366868830",
                "role": "COACH",
                "date_of_birth": "2000-02-03T00:00:00.000Z",
                "google_link": null,
                "facebook_link": null,
                "apple_link": null,
                "is_coacher": true,
                "is_collaborator": false,
                "is_account_verified": false,
                "account_verify_status": "NOT_APPROVE",
                "instances_id": [
                  "token_device_test",
                  "tokenFB",
                  "2222211111",
                  "cAGNgrgfBK3TWS8VJU9ksq:APA91bF8loou2V4I2XB74P4zmvF5wwQcNgyoDwhv2Yb4K8TLKaLgwWjY8PRVDYNFHNORf9nCsTbEbdngitK4Nbhd7bGZ9ZRMCzi02ARVlU5_ZxFVCrUbTL4UPib4-k9pEmbu70NtLnDC",
                  "ekjqZB0wYkj2lyTsKw2QUA:APA91bHJw-ZVhaCI0ZvVgC9A6vsVhcZb0l74GECFartZtfzlatYX0Bo0TlpsEWySpCtznyL23zTvZAZpJbTZPPw-tfj8Gfyb8TdF0L2Jy41kwh-MxOyxJrRc8VIP3NllXLfcjUPCNv5r",
                  "cksngiCI1SH1XbJMohLq8n:APA91bFBs4hcHmuQOzji2gUPO3Qv0fPmAshHLtjLAkKo7Oyqk0LnvP-7sTSineSM1zt3kiUrPKEZUntwva_J88xxbthxU8Yi3oVq17NTsXcPvMeeDi2aqCbaqVyvoJ_wqrPyZGI8xR10",
                  "d_VzEvGe7F5wbmjnJAtkbv:APA91bHf8GjauGYjWj-yrKJ7APTZtYxQVJGwY1eyYHhJZbH_PywnrgBHSCWfh2BEU41TmL72aSx6Id0Axzupjoj6qFiQA83SLy1NrLcW4gPIIgm6EMFANNtIQ25KTpDDA89S7-Es5o76",
                  "e6K9oPZ9YPuwcE_xSdUYOb:APA91bFrEkJIorbZRdzlSeU4LU74REWrH-bXZLUwCh_0H5P0VppudiI62mTP1BGmpPGBFWTfnAxIEnFxwZ15zFzJS54mcHeqVFd24ZizVXjtvGO5IkOlt9A01gmSpybm_MS4aLjzn5As",
                  "token_device"
                ],
                "user_type": "DEFAULT",
                "invited_by": null,
                "status": "ACTIVE",
                "coach_id": null,
                "invited_at": null,
                "choose_coach_at": null,
                "created_at_unix_timestamp": "1704428124655",
                "created_at": "2024-01-05T04:15:24.238Z",
                "updated_at": "2024-02-21T03:43:57.391Z",
                "deleted_at": null
              },
              "coach_name": "TEST COACHER TRAM 1",
              "token":
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7InVzZXJfaWQiOiI1ZDJmN2U2MC1iMDJiLTExZWUtOWViMi0zOWZiNWU3ZGU3NDkiLCJwaG9uZV9udW1iZXIiOiIwOTMwOTMwOTMwIiwicm9sZSI6IkNPQUNIIn0sInJvbGUiOiJBQ0NFU1NfVE9LRU4iLCJleHAiOjE3MTIzMTE1MTEsImlhdCI6MTcwOTYzMzExMX0.VYQW4eJ-GV_yspZStcFpzsmLvBmNA9uwmuoYpcVFkQg",
              "rfToken":
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7InJvbGUiOiJDT0FDSCIsInVzZXJfaWQiOiI1ZDJmN2U2MC1iMDJiLTExZWUtOWViMi0zOWZiNWU3ZGU3NDkiLCJwaG9uZV9udW1iZXIiOiIwOTMwOTMwOTMwIn0sInJvbGUiOiJSRUZSRVNIX1RPS0VOIiwiZXhwIjoxNzEyMjI1MTExLCJpYXQiOjE3MDk2MzMxMTF9.9BS_2gaVOMf5JhK2LPKLmPNMxjDJCpYNXj2R-5tN5pI"
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
}
