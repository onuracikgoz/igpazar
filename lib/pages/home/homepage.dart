// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:igpazar/widgets/navigation_bar/navigation_bar_web.dart';
// import 'package:igpazar/widgets/wrapcustom.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(children: [
//         Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//             colors: [
//               Color(0xFFfeda75),
//               Color(0xFFfa7e1e),
//               Color(0xFFd62976),
//               Color(0xFF962fbf),
//               Color(0xFF4f5bd5)
//             ],
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//           )),
//         ),
//         SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(40.0),
//             child: Column(
//               children: [
//                 NavigationBarWeb(),
//                 SizedBox(
//                   height: 70.0,
//                 ),
//                 Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     child: WrapCustom()),
//               ],
//             ),
//           ),
//         ),
//       ]),
//     );
//   }

//   final Shader linearGradient = LinearGradient(
//     colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
//   ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
// }
