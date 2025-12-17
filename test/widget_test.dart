// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:ohsecour/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and wait for animations to settle.
    await tester.pumpWidget(const EmergencyApp());
    await tester.pumpAndSettle();

    // Verify that the welcome screen shows the "COMMENCER" button.
    expect(find.text('COMMENCER'), findsOneWidget);
  });
}
