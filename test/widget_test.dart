import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_uniflutter/main.dart';

void main() {
  testWidgets('App loads login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const PantSysApp());
    expect(find.text('Iniciar Sesión'), findsOneWidget);
  });
}
