// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Login Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(isLoggedIn: false));

    await tester.enterText(
        find.byKey(const Key("email")), "davidbate@gmail.com");

    await tester.tap(find.widgetWithText(ElevatedButton, "Sign In"));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);

    await tester.enterText(find.byKey(const Key("password")), "123456");
  });
}
