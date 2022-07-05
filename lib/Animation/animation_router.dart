import 'package:widget_learn/Animation/Animation01.dart';
import 'package:widget_learn/Animation/Animation02.dart';
import 'package:widget_learn/Animation/Animation03.dart';
import 'package:widget_learn/Animation/Animation04.dart';
import 'package:widget_learn/Animation/AnimationList.dart';
import 'package:widget_learn/routers/i_router.dart';
import 'package:fluro/fluro.dart';

class AnimationRouter implements IRouterProvider {
  static String animationList = "/animation";

  static String animation01 = "/animation/animation01";

  static String animation02 = "/animation/animation02";

  static String animation03 = "/animation/animation03";

  static String animation04 = "/animation/animation04";

  @override
  void initRouter(FluroRouter router) {
    router.define(animationList,
        handler: Handler(handlerFunc: (_, __) => AnimationListWidget()));

    router.define(animation01,
        handler: Handler(
            handlerFunc: (_, __) => const Animation01(title: "两行代码就能动起来")));

    router.define(animation02,
        handler: Handler(
            handlerFunc: (_, __) =>
                const Animation02(title: "在不同控件之间切换的过渡动画")));

    router.define(animation03,
        handler: Handler(
            handlerFunc: (_, __) =>
                const Animation03(title: "更多动画控件及曲线（Curves）")));

    router.define(animation04,
        handler: Handler(
            handlerFunc: (_, __) =>
                const Animation04(title: "内置的还不够？万能的补间动画")));
  }
}
