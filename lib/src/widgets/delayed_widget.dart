// import 'package:flutter/material.dart';

// class DelayedWidget extends StatelessWidget {
//   DelayedWidget({
//     Key? key,
//     this.delay = 0,
//     required this.child,
//   }) : super(key: key);

//   /// The duration of the delay in milliseconds
//   int delay;

//   /// The widget to be displayed after the delay
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<void>(
//       future: Future.delayed(Duration(milliseconds: delay)),
//       builder: (context, snapshot) {
//         return snapshot.connectionState == ConnectionState.done
//             ? child
//             : Container();
//       },
//     );
//   }
// }
