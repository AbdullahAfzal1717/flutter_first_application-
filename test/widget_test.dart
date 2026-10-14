import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/lab6_main_screen.dart';
import 'package:flutter_application_1/screens/second_screen.dart';

void main() {
  testWidgets('Lab 6 home screen renders students and navigation controls', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Student directory'), findsOneWidget);
    expect(find.text('Students'), findsOneWidget);
    expect(find.byType(StudentCard), findsAtLeast(1));
    expect(find.byType(BottomAppBar), findsOneWidget);
    expect(find.byTooltip('Show message'), findsOneWidget);
    expect(find.byTooltip('Home'), findsOneWidget);
    expect(find.byTooltip('Profile'), findsOneWidget);
    expect(find.byTooltip('Settings'), findsOneWidget);
  });

  testWidgets('username is passed to the second screen and returned from it', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField), 'Alex');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Open'));
    await tester.pumpAndSettle();

    expect(find.byType(SecondScreen), findsOneWidget);
    expect(find.text('Welcome, Alex!'), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Go Back'));
    await tester.pumpAndSettle();
    expect(find.text('Student directory'), findsOneWidget);
  });

  testWidgets('drawer opens destination screens', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    expect(find.text('SliverAppBar Demo'), findsOneWidget);

    await tester.tap(find.text('SliverAppBar Demo'));
    await tester.pumpAndSettle();
    expect(find.byType(CustomScrollView), findsOneWidget);
    expect(find.text('Sliver list item 1'), findsOneWidget);
  });
}
