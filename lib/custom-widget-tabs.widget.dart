import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:persistent_bottom_nav_bar_example_project/custom_navbar_widget.dart';
import 'screens.dart';

class CustomWidgetExample extends StatefulWidget {
  final BuildContext menuScreenContext;
  final List<String> arguments;
  CustomWidgetExample({Key key, this.arguments, this.menuScreenContext}) : super(key: key);

  @override
  _CustomWidgetExampleState createState() => _CustomWidgetExampleState();
}

class _CustomWidgetExampleState extends State<CustomWidgetExample> {
  PersistentTabController _controller;


  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      MainScreen2(),
      MainScreen(
        menuScreenContext: widget.menuScreenContext,
        onScreenHideButtonPressed: () {
          setState(() {
          });
        },
      )
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Bar Demo')),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.arguments[0]),
            ],
          ),
        ),
      ),
      body: PersistentTabView.custom(
        context,
        controller: _controller,
        screens: _buildScreens(),
        // confineInSafeArea: true,
        itemCount: 2,
        stateManagement: true,
        customWidget: CustomNavBarWidget(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
            });
          },
          selectedIndex: _controller.index,
        ),
      ),
    );
  }
}
