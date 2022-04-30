import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_example_project/custom-widget-tabs.widget.dart';
import 'package:persistent_bottom_nav_bar_example_project/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => CustomWidgetExample(
            arguments: args as List<String>,
          ),
        );
      case '/first':
        return MaterialPageRoute(builder: (_) => const  MainScreen2());
      // case '/second':
      //   return MaterialPageRoute(builder: (_) => MainScreen3());
      default:
        // If there is no such named route in the switch statement,
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
