import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/home/home_module.dart';

import 'configuration/configuration_page.dart';
import 'shared/stores/app_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        AutoBind.singleton(AppStore.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        ),
      ];
}
