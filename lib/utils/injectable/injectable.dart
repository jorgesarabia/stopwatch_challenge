import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async => await getIt.init();
