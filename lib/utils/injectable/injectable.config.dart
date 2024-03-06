// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;
import 'package:stopwatch_challenge/data/stopwatch_service.dart' as _i5;
import 'package:stopwatch_challenge/models/stopwatch_model.dart' as _i4;
import 'package:stopwatch_challenge/utils/injectable/modules.dart' as _i7;
import 'package:stopwatch_challenge/views/controllers/stopwatch_controller.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final modules = _$Modules();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => modules.prefs,
      preResolve: true,
    );
    gh.factory<_i4.StopwatchModel>(() => modules.stopwatchModel);
    gh.factory<_i5.StopwatchService>(
        () => _i5.StopwatchService(gh<_i3.SharedPreferences>()));
    gh.factory<_i6.StopwatchController>(() => _i6.StopwatchController(
          gh<_i4.StopwatchModel>(),
          gh<_i5.StopwatchService>(),
        ));
    return this;
  }
}

class _$Modules extends _i7.Modules {}
