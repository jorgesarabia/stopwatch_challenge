import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';

@module
abstract class Modules {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  StopwatchModel get stopwatchModel => StopwatchModel.empty();

  Stopwatch get stopwatch => Stopwatch();
}
