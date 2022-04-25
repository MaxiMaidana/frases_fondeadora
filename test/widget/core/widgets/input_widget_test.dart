import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora_frase/core/app.dart';

void main() {
  group('input widget 1', () {
    testWidgets('input widget 1 exist', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final input = find.byKey(const Key('input1'));
      expect(input, findsOneWidget);
    });
    testWidgets('input widget 2 input email', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final input = find.byKey(const Key('input1'));
      String email = 'asd@asd.com';
      expect(find.text(email), findsNothing);
      await tester.enterText(input, email);
      await tester.pump();
      expect(find.text(email), findsOneWidget);
    });
  });

  group('input widget 2', () {
    testWidgets('input widget 2 exist', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final input = find.byKey(const Key('input2'));
      expect(input, findsOneWidget);
    });
    testWidgets('input widget 2 input pass', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final input = find.byKey(const Key('input1'));
      String pass = 'Asd1234.';
      expect(find.text(pass), findsNothing);
      await tester.enterText(input, pass);
      await tester.pump();
      expect(find.text(pass), findsOneWidget);
    });
  });
}
