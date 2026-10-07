import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('contacts list renders contact details and call buttons', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Contacts'), findsOneWidget);
    expect(find.text('${contacts.length} contacts'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ContactTile), findsAtLeast(1));
    expect(find.text('Aarav Sharma'), findsOneWidget);
    expect(find.text('+91 98765 43210'), findsOneWidget);
    expect(find.byIcon(Icons.call_rounded), findsAtLeast(1));
  });

  testWidgets('call button shows selected contact feedback', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Call Aarav Sharma'));
    await tester.pump();

    expect(find.text('Calling Aarav Sharma at +91 98765 43210'), findsOneWidget);
  });
}
