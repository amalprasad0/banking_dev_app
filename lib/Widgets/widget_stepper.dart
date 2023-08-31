// import 'package:flutter/material.dart';

// class WidgetStepper extends StatelessWidget {
//   const WidgetStepper({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       child:  Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(width:26.00,height: 26.0,decoration: BoxDecoration(color:Colors.white,border: Border.all(color: Colors.green),borderRadius: BorderRadius.circular(50))),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 2),
//             child: SizedBox(width: 10, height: 5,child: Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10))),),
//           ),
//           const Icon(Icons.check_circle, color: Colors.green,size: 31.00,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 2),
//             child: SizedBox(width: 10, height: 5,child: Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10))),),
//           ),
//           const Icon(Icons.check_circle, color: Color.fromARGB(255, 22, 182, 28),size: 31.00,),
//         ],
//       )
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class WidgetStepper extends StatelessWidget {
//   final Color firstCircleColor;
//   final Color secondCircleColor;
//   final Color iconColor;

//   const WidgetStepper({
//     Key? key,
//     required this.firstCircleColor,
//     required this.secondCircleColor,
//     required this.iconColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 26.0,
//             height: 26.0,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: firstCircleColor),
//               borderRadius: BorderRadius.circular(50),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 2),
//             child: SizedBox(
//               width: 10,
//               height: 5,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: firstCircleColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           const Icon(Icons.check_circle, color: firstCircleColor, size: 31.0),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 2),
//             child: SizedBox(
//               width: 10,
//               height: 5,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: secondCircleColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           const Icon(Icons.check_circle, color: secondCircleColor, size: 31.0),
//         ],
//       ),
//     );
//   }
// }
