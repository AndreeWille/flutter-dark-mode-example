import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_manager.dart';

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeMode _groupValue;
  ThemeManager _themeManager;

  @override
  void initState() {
    super.initState();
    _themeManager = Provider.of<ThemeManager>(context, listen: false);
    _groupValue = _themeManager.themeMode;
  }

  void _updateTheme(ThemeMode themeMode) {
    _themeManager.themeMode = themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 10.0),
              child: Text("Select Theme", style: TextStyle(fontSize: 24.0),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Radio(
                  onChanged: (val) => setState(() {
                    _groupValue = val;
                    _updateTheme(val);
                  }),
                  value: ThemeMode.system,
                  groupValue: _groupValue,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    var val = ThemeMode.system;
                    _groupValue = val;
                    _updateTheme(val);
                  }),
                  child: Text(
                    "System",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Radio(
                onChanged: (val) => setState(() {
                  _groupValue = val;
                  _updateTheme(val);
                }),
                value: ThemeMode.light,
                groupValue: _groupValue,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  var val = ThemeMode.light;
                  _groupValue = val;
                  _updateTheme(val);
                }),
                child: Text(
                  "Light",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Radio(
                onChanged: (val) => setState(() {
                  _groupValue = val;
                  _updateTheme(val);
                }),
                value: ThemeMode.dark,
                groupValue: _groupValue,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  var val = ThemeMode.dark;
                  _groupValue = val;
                  _updateTheme(val);
                }),
                child: Text(
                  "Dark",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}
