import 'package:flutter/material.dart';

class AnimationListWidget extends StatefulWidget {
  AnimationListWidget({Key? key}) : super(key: key);

  @override
  State<AnimationListWidget> createState() => _AnimationListWidgetState();
}

class _AnimationListWidgetState extends State<AnimationListWidget> {
  List<String> menuItems = ["两行代码就能动起来", "在不同控件之间切换的过渡动画", "显示动画", "自定义显示动画"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("动画")),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final text = menuItems[index];
            return ListTile(
                title: Text(text),
                onTap: () =>
                    {Navigator.pushNamed(context, '/animation0${index + 1}')});
          },
          separatorBuilder: (context, index) {
            return const Divider(height: 1);
          },
          itemCount: menuItems.length),
    );
  }
}
