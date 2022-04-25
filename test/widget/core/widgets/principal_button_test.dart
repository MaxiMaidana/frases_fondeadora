import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora_frase/core/app.dart';
import 'package:fondeadora_frase/core/widgets/principal_button.dart';

void main() {
  group('principal button widget', () {
    testWidgets('press button exist', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final button = find.byType(PrincipalButton);
      expect(button, findsOneWidget);
    });
  });
}
