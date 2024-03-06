// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stopwatch_challenge/models/stopwatch_model.dart' as _i3;
import 'package:stopwatch_challenge/utils/injectable/modules.dart' as _i5;
import 'package:stopwatch_challenge/views/controllers/stopwatch_controller.dart'
    as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final modules = _$Modules();
    gh.factory<_i3.StopwatchModel>(() => modules.stopwatchModel);
    gh.factory<_i4.StopwatchController>(
        () => _i4.StopwatchController(gh<_i3.StopwatchModel>()));
    return this;
  }
}

class _$Modules extends _i5.Modules {}
