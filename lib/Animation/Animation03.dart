import 'package:flutter/material.dart';

class Animation03 extends StatefulWidget {
  const Animation03({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Animation03> createState() => _Animation03State();
}

class _Animation03State extends State<Animation03> {
  bool toTop = false;

  @override
  Widget build(BuildContext context) {
    var animatedOpacity = AnimatedOpacity(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      opacity: 1,
      child: Container(
        width: 300,
        height: 300,
        color: Colors.blueAccent,
      ),
    );

    var animatedPadding = AnimatedPadding(
        curve: Curves.easeInOutCubic,
        padding: toTop
            ? const EdgeInsets.only(top: 0)
            : EdgeInsets.only(top: MediaQuery.of(context).size.height - 460),
        duration: const Duration(seconds: 1),
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blueAccent,
        ));

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: animatedPadding,
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
                setState(() => {toTop = !toTop}),
              },
          child: const Icon(Icons.currency_exchange)),
    );
  }
}
