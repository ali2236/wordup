import 'package:get_it/get_it.dart';
import '../../core/core.dart';

abstract class GetItInjector implements Injector {
  final container = GetIt.asNewInstance();

  @override
  T get<T extends Object>() {
    return container.get<T>();
  }
}
