import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stopwatch_challenge/models/saved_stopwatch.dart';
import 'package:stopwatch_challenge/models/stopwatch_model.dart';

@injectable
class StopwatchService {
  const StopwatchService(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const _key = 'savedTimerKey';

  Future<void> saveStopwatch({
    required StopwatchModel stopwatchModel,
    required int bestLap,
    required int worstLap,
  }) async {
    final savedList = await getSavedStopwatches();
    final toSave = SavedStopwatch(
      stopwatchModel: stopwatchModel,
      bestLap: bestLap,
      worstLap: worstLap,
      savedAt: DateTime.now(),
    );
    savedList.add(toSave);

    final mapList = savedList.map((object) => object.toJson()).toList();
    final jsonList = jsonEncode(mapList);

    await _sharedPreferences.setString(_key, jsonList);
  }

  Future<List<SavedStopwatch>> getSavedStopwatches() async {
    final stopWatchesString = _sharedPreferences.getString(_key);

    if (stopWatchesString != null) {
      final storedJsonList = (jsonDecode(stopWatchesString) as List<dynamic>).cast<Map<String, dynamic>>();
      final storedList = storedJsonList.map((json) => SavedStopwatch.fromJson(json)).toList();

      return storedList;
    }

    return [];
  }

  Future<void> deleteSavedStopwatches() async => await _sharedPreferences.remove(_key);
}
