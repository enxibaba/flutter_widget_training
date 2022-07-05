import 'dart:math';
import 'package:flutter/material.dart';

class Animation01 extends StatefulWidget {
  const Animation01({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Animation01> createState() => _Animation01State();
}

class _Animation01State extends State<Animation01> {
  double height = 200;

  final count = Colors.primaries.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            """
/// See also:
///
///  * [AnimatedPadding], which is a subset of this widget that only
///    supports animating the [padding].
///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
///  * [AnimatedPositioned], which, as a child of a [Stack], automatically
///    transitions its child's position over a given duration whenever the given
///    position changes.
///  * [AnimatedAlign], which automatically transitions its child's
///    position over a given duration whenever the given [AnimatedAlign.alignment] changes.
///  * [AnimatedSwitcher], which switches out a child for a new one with a customizable transition.
///  * [AnimatedCrossFade], which fades between two children and interpolates their sizes.
            """,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        Center(
            child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 300,
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.primaries[Random().nextInt(count)].shade100,
                    Colors.primaries[Random().nextInt(count)].shade300
                  ]),
              borderRadius: BorderRadius.circular(150)),
          child: const Center(
            child: Text(
              "Hello",
              style: TextStyle(fontSize: 72, color: Colors.white),
            ),
          ),
        )),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() => {
                if (height == 200) {height = 300} else {height = 200}
              }),
        },
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
