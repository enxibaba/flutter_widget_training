import 'package:flutter/material.dart';

class Animation04 extends StatefulWidget {
  const Animation04({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Animation04> createState() => _Animation04State();
}

/// TweenAnimationBuilder
///  Tween（ begin：  end: )
///  begin 没有，会自动复制 end 的值, end值修改后，会直接从当前状态向 end 值过渡
///  duration： 动画持续时间
///  builder: (BuildContext context, double value, Widget? child)
///
class _Animation04State extends State<Animation04> {
  bool _big = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: TweenAnimationBuilder(
            tween: Tween<double>(end: _big ? 4 : 2),
            duration: const Duration(seconds: 5),
            builder: (BuildContext context, double value, Widget? child) =>
                Transform.scale(
                    scale: value,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: const Center(
                          child: Text('Hi', style: TextStyle(fontSize: 72))),
                    ))
            // Opacity(
            //     opacity: value,
            //     child: Container(
            //       width: 300,
            //       height: 300,
            //       color: Colors.blue,
            //     )),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _big = !_big;
        }),
        child: const Icon(Icons.cable_outlined),
      ),
    );
  }
}
