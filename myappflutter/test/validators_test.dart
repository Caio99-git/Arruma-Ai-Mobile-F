import 'package:flutter_test/flutter_test.dart';
import 'package:myappflutter/utils/validators.dart';

void main() {
  group('Validators.email', () {
    test('returns null for a valid email', () {
      expect(Validators.email('user@example.com'), isNull);
      expect(Validators.email('first.last+tag@sub.domain.co'), isNull);
    });

    test('trims whitespace before validating', () {
      expect(Validators.email('  user@example.com  '), isNull);
    });

    test('returns required message for null or empty input', () {
      expect(Validators.email(null), 'Informe o e-mail');
      expect(Validators.email(''), 'Informe o e-mail');
      expect(Validators.email('   '), 'Informe o e-mail');
    });

    test('returns format error for malformed email', () {
      expect(Validators.email('not-an-email'), 'E-mail inválido');
      expect(Validators.email('missing@tld'), 'E-mail inválido');
      expect(Validators.email('@no-local.com'), 'E-mail inválido');
      expect(Validators.email('spaces in@email.com'), 'E-mail inválido');
    });
  });

  group('Validators.password', () {
    test('returns null when password has at least 6 characters', () {
      expect(Validators.password('123456'), isNull);
      expect(Validators.password('aStrongPass!'), isNull);
    });

    test('returns required message when null or empty', () {
      expect(Validators.password(null), 'Informe a senha');
      expect(Validators.password(''), 'Informe a senha');
    });

    test('returns length message when shorter than 6 characters', () {
      expect(
        Validators.password('12345'),
        'A senha deve ter no mínimo 6 caracteres',
      );
      expect(
        Validators.password('a'),
        'A senha deve ter no mínimo 6 caracteres',
      );
    });

    test('does not trim — leading/trailing spaces count toward length', () {
      expect(Validators.password('   abc'), isNull);
    });
  });

  group('Validators.notEmpty', () {
    test('returns null for non-empty trimmed input', () {
      expect(Validators.notEmpty('hello'), isNull);
      expect(Validators.notEmpty('  hello  '), isNull);
    });

    test('returns default message for null/empty/whitespace', () {
      expect(Validators.notEmpty(null), 'Campo é obrigatório');
      expect(Validators.notEmpty(''), 'Campo é obrigatório');
      expect(Validators.notEmpty('   '), 'Campo é obrigatório');
    });

    test('uses custom fieldName in the error message', () {
      expect(
        Validators.notEmpty('', fieldName: 'Cidade'),
        'Cidade é obrigatório',
      );
    });
  });

  group('Validators.cep', () {
    test('accepts CEP with and without hyphen', () {
      expect(Validators.cep('01310-100'), isNull);
      expect(Validators.cep('01310100'), isNull);
    });

    test('returns required message when null or empty', () {
      expect(Validators.cep(null), 'Informe o CEP');
      expect(Validators.cep(''), 'Informe o CEP');
      expect(Validators.cep('   '), 'Informe o CEP');
    });

    test('returns format error for invalid CEP', () {
      expect(Validators.cep('123'), 'CEP inválido (use 00000-000)');
      expect(Validators.cep('123456789'), 'CEP inválido (use 00000-000)');
      expect(Validators.cep('abcde-fgh'), 'CEP inválido (use 00000-000)');
      expect(Validators.cep('01310-10'), 'CEP inválido (use 00000-000)');
    });
  });
}
