// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:covid_form/main.dart';

void main() {
  testWidgets('find form page element test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(CovidForm());

    expect(find.byKey(Key('form-page-tag')), findsOneWidget);
    expect(find.byKey(Key('firstname-tag')), findsOneWidget);
    expect(find.byKey(Key('lastname-tag')), findsOneWidget);
    expect(find.byKey(Key('nickname-tag')), findsOneWidget);
    expect(find.byKey(Key('age-tag')), findsOneWidget);
  });
}
