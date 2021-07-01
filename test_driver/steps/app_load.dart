import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric appLoad() {
  return given1<String, FlutterWorld>(
    '{string} loaded',
    (key, context) async {
      find.byValueKey(key);
    },
  );
}
