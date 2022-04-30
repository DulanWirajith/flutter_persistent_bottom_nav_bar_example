import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_example_project/route_generator.dart';

void main() => runApp(MyApp());

BuildContext testContext;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar example project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,

    );
  }
}

class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Project"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
              child: Text("Custom widget example"),
              // onPressed: () => pushNewScreen(
              //   context,
              //   screen: CustomWidgetExample(
              //     menuScreenContext: context,
              //   ),
              // ),
              onPressed: ()=>Navigator.of(context).pushNamed('/home', arguments: ['HEY']),
            ),
          ),
        ],
      ),
    );
  }
}

