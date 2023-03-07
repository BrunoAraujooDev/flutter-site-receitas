import 'package:flutter/material.dart';
import 'package:projeto_rotas/components/main_drawer.dart';
import 'package:projeto_rotas/models/settings.dart';

class SettingScreen extends StatefulWidget {

  final Settings setting;
  final Function(Settings) onSettingsChanged;
  const SettingScreen({Key? key, required this.onSettingsChanged, required this.setting}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {


  late Settings settings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settings = widget.setting;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: (value){
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem glúten',
                  'Só exibe refeições sem glúten',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),_createSwitch(
                  'Sem lactose',
                  'Só exibe refeições sem lactose',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),_createSwitch(
                  'Vegana',
                  'Só exibe refeições vegana',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),_createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
