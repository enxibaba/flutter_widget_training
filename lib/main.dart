import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:widget_learn/Animation/animation_router.dart';
import 'package:widget_learn/routers/fluro_navigator.dart';
import 'package:widget_learn/routers/not_found_page.dart';
import 'routers/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    Routes.initRoutes();
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      onGenerateRoute: Routes.router.generator,
      navigatorKey: navigatorKey,
      onUnknownRoute: (_) {
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const NotFoundPage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> menuItems = ["动画", "布局", "异步"];
  List<String> routers = [AnimationRouter.animationList, "/layout", "/async"];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Flutter Demo"),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              final text = menuItems[index];
              return ListTile(
                  title: Text(text),
                  onTap: () => NavigatorUtils.push(context, routers[index]));
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 1);
            },
            itemCount: menuItems.length));
  }
}

// Stack(
//           children: [
//             ...List.generate(5, (_) => GamePad(controller: _controller)),
//             Pad(controller: _controller),
//           ],
//         ))

// class GamePad extends StatefulWidget {
//   GamePad({Key? key, required this.controller}) : super(key: key);

//   final StreamController controller;

//   @override
//   State<GamePad> createState() => _GamePadState();
// }

// class _GamePadState extends State<GamePad> with SingleTickerProviderStateMixin {
//   double x = 0;
//   int a = 0;
//   int b = 0;
//   int d = 1;
//   Color color = Colors.white;

//   late AnimationController _controller;

//   void reset() {
//     x = Random().nextDouble() * 300;
//     a = Random().nextInt(5) + 1;
//     b = Random().nextInt(5);
//     d = Random().nextInt(5) + 5;
//     color =
//         Colors.primaries[Random().nextInt(Colors.primaries.length)].shade200;
//   }

//   @override
//   void initState() {
//     _controller = AnimationController(vsync: this);
//     reset();
//     _controller.duration = Duration(seconds: d);
//     _controller.forward();
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         reset();
//         _controller.forward(from: 0.0);
//       }
//     });

//     widget.controller.stream.listen((event) {
//       if (event == a + b) {
//         reset();
//         _controller.forward(from: 0.0);
//       }
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Positioned(
//             top: _controller.value * 600,
//             left: x,
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(width: 1),
//                   color: color),
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               child: Text("$a + $b"),
//             ),
//           );
//         });
//   }
// }

// class Pad extends StatelessWidget {
//   const Pad({Key? key, required this.controller}) : super(key: key);

//   final StreamController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         color: Colors.primaries.last.shade100,
//         child: GridView(
//           shrinkWrap: true,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3, childAspectRatio: 2 / 1),
//           children: List.generate(
//               9,
//               (index) => ElevatedButton(
//                   style: TextButton.styleFrom(
//                       shape: const RoundedRectangleBorder(),
//                       backgroundColor: Colors
//                           .primaries[Random().nextInt(Colors.primaries.length)]
//                           .shade200),
//                   onPressed: () => controller.add(index + 1),
//                   child: Text("${index + 1}",
//                       style: const TextStyle(fontSize: 20)))),
//         ),
//       ),
//     );
//   }
// }
