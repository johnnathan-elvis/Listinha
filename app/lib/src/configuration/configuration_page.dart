import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../shared/stores/app_store.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final appStore = Modular.get<AppStore>();

  void _changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      appStore.themeMode = mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => appStore.themeMode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listinha'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: appStore.themeMode,
              title: const Text('Sistema'),
              onChanged: _changeThemeMode,
            ),
            RadioListTile(
              value: ThemeMode.light,
              groupValue: appStore.themeMode,
              title: const Text('Claro'),
              onChanged: _changeThemeMode,
            ),
            RadioListTile(
              value: ThemeMode.dark,
              groupValue: appStore.themeMode,
              title: const Text('Escuro'),
              onChanged: _changeThemeMode,
            ),
            const SizedBox(height: 20),
            Text(
              'Controle de dados',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Apagar cache e reinicar o app'),
            )
          ],
        ),
      ),
    );
  }
}
