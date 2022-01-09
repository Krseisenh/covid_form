import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric scrollUntil() {
  return when1<String, FlutterWorld>(
    'I scroll down until find {string}',
    (key, context) async {
      final finder = find.byValueKey(key);
      await context.world.driver!.scroll(
        finder,
        0,
        -400,
        const Duration(milliseconds: 1000),
      );
    },
  );
}
