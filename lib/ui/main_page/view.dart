import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Dispatch myDispatch;
Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  myDispatch = dispatch;
  print("state.selectedIndex = ");
  println(state.selectedIndex);
  return Scaffold(
    appBar: AppBar(
      title: const Text('BottomNavigationBar Sample'),
    ),
    body: Center(
      child: PageView(
        onPageChanged: _pageChange,
        controller: _pageController,
        children: state.widgetOptions,
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Business'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('School'),
        ),
      ],
      currentIndex: state.selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    ),
  );
}

var _pageController = new PageController(initialPage: 0);

void _onItemTapped(int index) {
  println(index);
  _pageController.jumpToPage(index);
  myDispatch(MainActionCreator.onTabchange(index));
}

void _pageChange(int index) {
  myDispatch(MainActionCreator.onTabchange(index));
}
