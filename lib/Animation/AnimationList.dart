import 'package:flutter/material.dart';
import 'package:widget_learn/Animation/animation_router.dart';
import 'package:widget_learn/routers/fluro_navigator.dart';

class AnimationListWidget extends StatefulWidget {
  AnimationListWidget({Key? key}) : super(key: key);

  @override
  State<AnimationListWidget> createState() => _AnimationListWidgetState();
}

class _AnimationListWidgetState extends State<AnimationListWidget> {
  List<String> menuItems = [
    "两行代码就能动起来",
    "在不同控件之间切换的过渡动画",
    "更多动画控件及曲线（Curves）",
    "内置的还不够？万能的补间动画"
  ];
  List<String> routerNames = [
    AnimationRouter.animation01,
    AnimationRouter.animation02,
    AnimationRouter.animation03,
    AnimationRouter.animation04
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("动画")),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final text = menuItems[index];
            return ListTile(
                title: Text(text),
                onTap: () => NavigatorUtils.push(context, routerNames[index]));
          },
          separatorBuilder: (context, index) {
            return const Divider(height: 1);
          },
          itemCount: menuItems.length),
    );
  }
}
