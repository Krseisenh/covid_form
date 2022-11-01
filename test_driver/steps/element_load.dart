import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../utils/uilts.dart';

class ElementLoaded extends Given1WithWorld<String, FlutterWorld> {
  ElementLoaded()
      : super(StepDefinitionConfiguration()
          ..timeout = Duration(milliseconds: 2000));

  @override
  Future<void> executeStep(String tag) async {
    await isAppeared(world.driver!, tag);
  }

  @override
  RegExp get pattern => RegExp(r"I should see {string} appeared");
}
