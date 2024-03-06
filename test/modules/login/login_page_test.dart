import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:research_flutter_unit_test/data/repositories/account/account_repository.dart';
import 'package:research_flutter_unit_test/modules/login/login_controller.dart';
import 'package:research_flutter_unit_test/modules/login/login_page.dart';
import 'package:research_flutter_unit_test/widgets/responsive/size_config.dart';

class MockAccountRepository extends Mock implements AccountRepository {}

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
              return const GetMaterialApp(home: LoginPage());
            },
          );
        },
      );
    });

    testWidgets("The login page displays all widgets when rendered", (tester) async {
      // Build the widget.
      await tester.pumpWidget(commonWidget);

      // Check the login page displays all widgets
      expect(find.text("Mời bạn nhập số điện thoại"), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byKey(const Key("loginButton")), findsOneWidget);
      expect(find.byIcon(Icons.east), findsOneWidget);
    });

    testWidgets("login page show error text 'Vui lòng nhập số điện thoại' when user don't type input phone",
        (tester) async {
      // Build the widget.
      await tester.pumpWidget(commonWidget);

      // (Optional: Assign value for textfield).
      await tester.enterText(find.byType(TextFormField), "");

      // Find & tap button.
      await tester.tap(find.byKey(const Key("loginButton")));

      // Waiting widget rebuild.
      await tester.pump();

      // Expect to find the item on screen.
      expect(find.text("Vui lòng nhập số điện thoại"), findsOneWidget);
    });

    testWidgets("login page show error text 'Số điện thoại không hợp lệ' when user don't type input phone",
        (tester) async {
      // Build the widget.
      await tester.pumpWidget(commonWidget);

      // (Optional: Assign value for textfield).
      await tester.enterText(find.byType(TextFormField), "12345");

      // Find & tap button.
      await tester.tap(find.byKey(const Key("loginButton")));

      // Waiting widget rebuild.
      await tester.pump();

      // Expect to find the item on screen.
      expect(find.text("Số điện thoại không hợp lệ"), findsOneWidget);
    });

    // Clear controller after every test case
    tearDown(() {
      Get.delete<LoginController>();
    });
  });
}
