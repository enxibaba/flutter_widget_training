import 'package:flutter/material.dart';

class Animation02 extends StatefulWidget {
  const Animation02({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<Animation02> createState() => _Animation02State();
}

class _Animation02State extends State<Animation02> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blueAccent,

          /// AnimatedSwitcher 的 child 发生变时（不同的控件/ 相同的控件需要提供key）
          /// 提供默认的动画实现 FadeTransition
          ///

          // child: AnimatedSwitcher(
          //     /// 通过 transitionBuilder 修改默认实现 FadeTransition
          //     transitionBuilder: (child, animation) {
          //       /// 组合使用
          //       return FadeTransition(
          //           opacity: animation,
          //           child: ScaleTransition(scale: animation, child: child));
          //     },
          //     duration: const Duration(seconds: 1),
          //     child: show
          //         ? const Text("Hello", style: TextStyle(fontSize: 72))
          //         : const Icon(
          //             Icons.ac_unit_rounded,
          //             size: 100,
          //             color: Colors.white,
          //           )),

          /// 如果只是2个控件之间的切换，可以使用 AnimatedSwitcher 的优化版本
          /// AnimatedCrossFade

          child: Center(
            child: AnimatedCrossFade(
                firstChild: const Text("Hello", style: TextStyle(fontSize: 72)),
                secondChild: const Icon(
                  Icons.ac_unit_rounded,
                  size: 100,
                  color: Colors.white,
                ),
                crossFadeState:
                    show ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() => {show = !show})
        },
        child: const Icon(Icons.change_circle),
      ),
    );
  }
}
