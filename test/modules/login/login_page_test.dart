import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:research_flutter_unit_test/data/models/account.dart';
import 'package:research_flutter_unit_test/data/repositories/account/iaccount_repository.dart';
import 'package:research_flutter_unit_test/modules/login/login_controller.dart';
import 'package:research_flutter_unit_test/modules/login/login_page.dart';
import 'package:research_flutter_unit_test/routes/app_pages.dart';
import 'package:research_flutter_unit_test/widgets/responsive/size_config.dart';

class MockAccountRepository extends Mock implements IAccountRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("Test case:: Login Page:: Widget Test", () {
    late MockAccountRepository mockAccountRepository;
    late LoginController loginController;
    late Widget commonWidget;

    setUp(() {
      mockAccountRepository = MockAccountRepository();
      loginController = LoginController(accountRepository: mockAccountRepository);
      // We need mock controller bcs UI is are depending on it
      Get.put(loginController);
      commonWidget = LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig(
                designScreenWidth: 375,
                designScreenHeight: 812,
              ).init(constraints, orientation);
              return GetMaterialApp(
                home: const LoginPage(),
                getPages: AppPages.pages,
              );
            },
          );
        },
      );
    });

    testWidgets('Case 1: Email, password, button, forgot password text are present', (WidgetTester tester) async {
      await tester.pumpWidget(commonWidget);

      final emailInputField = find.byKey(const Key('email_input'));
      final passwordInputField = find.byKey(const Key('password_input'));
      final loginButton = find.byKey(const Key('login_button'));
      final forgotPasswordText = find.text('Forgot password');

      expect(emailInputField, findsOneWidget);
      expect(passwordInputField, findsOneWidget);
      expect(loginButton, findsOneWidget);
      expect(loginButton, findsOneWidget);
      expect(forgotPasswordText, findsOneWidget);
    });

    testWidgets('Case 2: Email and password are invalid', (WidgetTester tester) async {
      await tester.pumpWidget(commonWidget);

      await tester.enterText(find.byKey(const Key('email_input')), 'test');
      await tester.enterText(find.byKey(const Key('password_input')), '123');

      await tester.pump();

      expect(find.text("Invalid email"), findsOneWidget);
      expect(find.text("Password too short"), findsOneWidget);
    });

    testWidgets('Case 3: Login button can click when and change color when data valid', (WidgetTester tester) async {
      await tester.pumpWidget(commonWidget);

      final loginButtonClick = find.byKey(const Key('login_button_click'));
      final loginButton = find.byKey(const Key('login_button'));

      expect((tester.widget(loginButtonClick) as InkWell).onTap, isNull);
      expect((tester.widget(loginButton) as Container).color, equals(Colors.grey));

      await tester.enterText(find.byKey(const Key('email_input')), 'flutter_test@gmail.com');
      await tester.enterText(find.byKey(const Key('password_input')), '123456789');

      await tester.pump();

      expect((tester.widget(loginButtonClick) as InkWell).onTap, isNotNull);
      expect((tester.widget(loginButton) as Container).color, equals(Colors.blue));

      // Stubbing the loginWithEmail method of mockRestAPI
      when(() => mockAccountRepository.loginWithEmail("flutter_test@gmail.com", "123456789"))
          .thenAnswer((_) async => Account());

      await tester.tap(loginButtonClick);

      await tester.pumpAndSettle();

      expect(Get.currentRoute, equals(Routes.MAIN));
    });

    testWidgets('Case 4: Forgot password button navigate', (WidgetTester tester) async {
      await tester.pumpWidget(commonWidget);

      final forgotPasswordButtonClick = find.byKey(const Key('forgot_password_click'));

      expect(forgotPasswordButtonClick, findsOneWidget);

      await tester.tap(forgotPasswordButtonClick);
      await tester.pumpAndSettle();

      expect(Get.currentRoute, equals(Routes.FORGOT_PASSWORD));
    });

    // Clear controller after every test case
    tearDown(() {
      Get.delete<LoginController>();
    });
  });
}
