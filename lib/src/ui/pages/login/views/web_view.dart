// External imports
import 'package:flutter/material.dart';
import 'package:frontend/src/ui/widgets/input_fields/name_input.dart';
import 'package:frontend/src/ui/widgets/input_fields/password_input.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WebView extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  bool _isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "lib/src/assets/patterns/memphis-mini/dark.png",
              repeat: ImageRepeat.repeat,
            ),
          ),
          Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: RawMaterialButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(16.0),
                  fillColor: Theme.of(context).primaryColor,
                  shape: const CircleBorder(),
                  child: Icon(
                    Theme.of(context).brightness == Brightness.dark
                        ? MdiIcons.weatherSunny
                        : MdiIcons.weatherNight,
                    size: 24.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Shwokl",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 32,
                  letterSpacing: 3.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Theme.of(context).primaryColor,
                child: Container(
                  width: 425,
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      const Text(
                        "Welcome back!",
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 3.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const NameInputFiled(null),
                      const SizedBox(height: 32),
                      const PasswordInputField(null),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.centerLeft,
                        width: 200,
                        height: 50,
                        child: CheckboxListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text("Remember me"),
                          value: _isRemember,
                          onChanged: (newValue) {
                            setState(() {
                              _isRemember = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      const SizedBox(height: 16),
                      RaisedButton(
                        colorBrightness: Brightness.light,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 80.0,
                        ),
                        color: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Theme.of(context).highlightColor,
                          fontSize: 14,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 80.0,
                        ),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
