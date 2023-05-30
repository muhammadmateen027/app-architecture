import 'package:stars/extensions/extensions.dart';
import 'package:stars/utils/optionals/optionals.dart';
import 'package:test/test.dart';

void main() {
  test('return null if none', () {
    const Option<String> option = None();

    expect(option.valueOrNull, null);
  });

  test('return value if there is one', () {
    final option = Option.of('text');

    expect(option.valueOrNull, option.value);
  });

  test('return else if there is no value', () {
    final option = Option.empty<String>();

    final valueOrElse = option.valueOrElse('placeHolder');

    expect(valueOrElse, 'placeHolder');
  });

  test('return value and not else if there is value', () {
    final option = Option.of('text');

    final valueOrElse = option.valueOrElse('placeHolder');

    expect(valueOrElse, 'text');
  });

  test('return empty option on null string', () {
    expect(null.toOption, Option.empty<String>());
  });

  test('return value option on value string', () {
    expect('testValue'.toOption, Option.of('testValue'));
  });

  test('return empty string if option is empty', () {
    expect(Option.empty<String>().emptyOrValue, '');
  });

  test('value string to option', () {
    expect(Option.of('testValue').emptyOrValue, 'testValue');
  });

  group('nullable optional', () {
    test('return else if there is no value', () {
      const Option<String>? option = null;

      final valueOrElse = option.valueOrElse('placeHolder');

      expect(valueOrElse, 'placeHolder');
    });

    test('return else if there is no value', () {
      const Option<double>? option = null;

      final valueOrElse = option.valueOrElse(600);

      expect(valueOrElse, 600.00);
    });
  });
}
