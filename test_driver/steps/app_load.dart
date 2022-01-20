import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../utils/uilts.dart';

StepDefinitionGeneric appLoad() {
  return given1<String, FlutterWorld>(
    '{string} loaded',
    (key, context) async {
      await isAppeared(context.world.driver!, key);
      await Future.delayed(Duration(milliseconds: 750));
    },
  );
}
