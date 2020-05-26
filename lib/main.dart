import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ui/main_page/page.dart';

void main() => runApp(createApp());

final AbstractRoutes routes = PageRoutes(
  pages: <String, Page<Object, dynamic>>{
    'main': MainPage(), //在这里添加页面
  },
);

Widget createApp() {
  println("create app");
  return MaterialApp(
    title: 'FishRedux',
    home: routes.buildPage('main', null), //把他作为默认页面
    // builder: FlutterBoost.init(postPush: _onRoutePushed),
    onGenerateRoute: (RouteSettings settings) {
      return CupertinoPageRoute<Map<dynamic, dynamic>>(builder: (BuildContext context) {
        println("route $settings.name  $settings.arguments");
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
    localizationsDelegates: [
      DefaultMaterialLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    ],
  );
}
