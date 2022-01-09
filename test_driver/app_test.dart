import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';

import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/app_load.dart';
import 'steps/chill_out.dart';
import 'steps/element_load.dart';
import 'steps/scroll_down.dart';
import 'steps/tap.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [
      Glob(r"test_driver/features/*.feature")
    ]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json'),
      FlutterDriverReporter(
        logErrorMessages: true,
        logInfoMessages: true,
        logWarningMessages: true,
      ),
    ]
    ..hooks = [
      AttachScreenshotOnFailedStepHook(),
    ]
    ..stepDefinitions = [
      tap(),
      appLoad(),
      scrollUntil(),
      ElementLoaded(),
      chillOut(),
    ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppWorkingDirectory = './'
    ..targetAppPath = "test_driver/app.dart"
    // ..buildFlavor = "staging" // uncomment when using build flavor and check android/ios flavor setup see android file android\app\build.gradle
    ..targetDeviceId = "47771B80-785D-4544-909F-E95800DFFF8B" // uncomment to run tests on all connected devices or set specific device target id
    // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
    ..logFlutterProcessOutput = true; // uncomment to see command invoked to start the flutter test app
  // ..verboseFlutterProcessLogs = true // uncomment to see the verbose output from the Flutter process
  // ..flutterBuildTimeout = Duration(minutes: 3) // uncomment to change the default period that flutter is expected to build and start the app within

  return GherkinRunner().execute(config);
}

// Key("nav_chart_graph_ytd")
// Key("nav_chart_graph_1m")


// When I tap on "ytd"
// Then I shoud see "ytd" graph
// And  Graph data change