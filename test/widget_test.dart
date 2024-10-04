import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fast_location/src/modules/home/page/home_page.dart';

void main() {
  testWidgets('Teste de interface básica', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Verifica se o texto "Consulta de CEP" está presente na tela.
    expect(find.text('Localizar Endereço'), findsOneWidget);
    expect(find.text('Nenhum resultado'), findsNothing);
  });
}
