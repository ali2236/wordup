import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordup/common/assets.dart';
import 'package:wordup/common/uris.dart';
import 'package:wordup/data/data.dart';
import 'package:wordup/core/core.dart';
import 'package:wordup/domain/dependency_injection/injector_getit.dart';
import 'package:wordup/domain/domain.dart';
import 'package:wordup/domain/feature/theme/repository/repository_theme_impl.dart';
import 'package:wordup/domain/repository/respository_word_info.dart';
import '../feature/accent/repository/repository_accent.dart';
import '../feature/theme/repository/repository_theme.dart';

class DebugInjector extends GetItInjector {
  @override
  Future<void> initialize() async {
    // Initialize SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // Preferences
    container.registerSingleton<KeyValueRepository>(
      KeyValueRepository(
        SharedPreferenceDataSource(
          prefs,
          fromJson: KeyValue.fromJson,
          prefix: 'kv',
        ),
      ),
    );

    // Themes
    container.registerSingleton<ThemeRepository>(
      ThemeRepositoryImpl(container.get()),
    );

    // Accent
    container.registerSingleton<AccentRepository>(
      AccentRepositoryImpl(container.get()),
    );

    // Network
    container.registerSingleton<NetworkClient>(
      HttpNetworkClient(basePath: wordUpCDN),
    );

    ///
    /// API
    ///
    container
        .registerSingleton<DataSource<MinimalWordInfo, int, StringQueryFilter>>(
          LocalWordInfoMinimalDataSource(Assets.assetsWords),
          instanceName: 'local',
        );
    container.registerSingleton<DataSource<Word, int, void>>(
      LocalWordDataSource(),
      instanceName: 'local',
    );
    container
        .registerSingleton<DataSource<MinimalWordInfo, int, StringQueryFilter>>(
          RemoteWordInfoMinimalDataSource(container.get()),
          instanceName: 'remote',
        );
    container.registerSingleton<DataSource<Word, int, void>>(
      RemoteWordDataSource(container.get()),
      instanceName: 'remote',
    );

    // repositories
    container.registerSingleton<WordInfoMinimalRepository>(
      WordInfoMinimalRepository(
        container.get(instanceName: 'local'),
        container.get(instanceName: 'remote'),
      ),
    );
    container.registerSingleton<WordRepository>(
      WordRepository(
        container.get(instanceName: 'local'),
        container.get(instanceName: 'remote'),
      ),
    );
    container.registerSingleton<WordInfoRepository>(
      WordInfoRepository(container.get(), container.get()),
    );
  }
}
