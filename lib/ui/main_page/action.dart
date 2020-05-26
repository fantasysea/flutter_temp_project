import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainAction { action ,tabchange}

class MainActionCreator {
  static Action onAction() {
    return const Action(MainAction.action);
  }

  static Action onTabchange(int index) {
    return  Action(MainAction.tabchange,payload:index);
  }
}
