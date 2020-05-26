import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/ui/home_page/page.dart';
import 'package:myapp/ui/order_page/page.dart';
import 'package:myapp/ui/user_page/page.dart';

class MainState implements Cloneable<MainState> {
  int selectedIndex = 0;
  static TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> widgetOptions = <Widget>[
  HomePage().buildPage(null),
  UserPage().buildPage(null),
  OrderPage().buildPage(null),
];



List<Widget> list = List();

  @override
  MainState clone() {
    return MainState();
  }
}

MainState initState(Map<String, dynamic> args) {
  MainState state = MainState();
  return state;
}
