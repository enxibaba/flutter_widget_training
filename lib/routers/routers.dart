import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:widget_learn/Animation/AnimationList.dart';
import 'package:widget_learn/Animation/animation_router.dart';
import 'package:widget_learn/routers/i_router.dart';

import 'not_found_page.dart';

class Routes {
  // static String home = "/home";

  static final List<IRouterProvider> _listRouter = [];

  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(handlerFunc: (context, parameters) {
      debugPrint('未找到目标页');
      return const NotFoundPage();
    });

    // router.define(home,
    //     handler: Handler(
    //         handlerFunc: (context, parameters) => AnimationListWidget()));

    _listRouter.clear();
    _listRouter.add(AnimationRouter());

    /// 各自路由各自模块管理

    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }

    _listRouter.forEach(initRouter);
  }
}
