import 'package:injectable/injectable.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';

@module
abstract class Modules {
  StopwatchModel get stopwatchModel => StopwatchModel();
}
