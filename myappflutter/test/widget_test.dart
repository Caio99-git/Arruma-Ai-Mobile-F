import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myappflutter/main.dart';
import 'package:myappflutter/screens/login_page.dart';

void main() {
  testWidgets('App boots and shows the LoginPage', (tester) async {
    await tester.pumpWidget(const ArrumaAiApp());

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.text('Arruma-Ai'), findsOneWidget);
    expect(find.text('E-mail:'), findsOneWidget);
    expect(find.text('Senha:'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
  });

  testWidgets('Tapping Entrar with empty fields shows validation errors',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    await tester.tap(find.text('Entrar'));
    await tester.pump();

    expect(find.text('Informe o e-mail'), findsOneWidget);
    expect(find.text('Informe a senha'), findsOneWidget);
  });

  testWidgets('Invalid email shows the format error', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    await tester.enterText(find.byType(TextFormField).first, 'not-an-email');
    await tester.enterText(find.byType(TextFormField).last, '123456');
    await tester.tap(find.text('Entrar'));
    await tester.pump();

    expect(find.text('E-mail inválido'), findsOneWidget);
  });
}
