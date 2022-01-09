import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../utils/uilts.dart';

StepDefinitionGeneric tap() {
  return when1<String, FlutterWorld>(
    'I tap the {string} and wait loading to finished',
    (key, context) async {
      final finder = find.byValueKey(key);
      await context.world.driver!.tap(finder);
      await isAppeared(context.world.driver!, "loading-key", true);
      await Future.delayed(const Duration(milliseconds: 2500));
      await isAppeared(context.world.driver!, "loading-key", false);
    },
  );
}
