// import 'package:admin_management/constants/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
//
// class CustomCircularProgressBar extends StatelessWidget {
//   final double progress1;
//   final double progress2;
//   final Color color1;
//   final Color color2;
//   final String taskAmount;
//   final List<String> circleTexts;
//   final List<Color> circleColors; // List of colors for the circles
//
//   CustomCircularProgressBar({
//     required this.progress1,
//     required this.progress2,
//     required this.color1,
//     required this.color2,
//     required this.taskAmount,
//     required this.circleTexts,
//     required this.circleColors, // Now required
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Container(
//       height: screenHeight*0.25,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Stack(
//             alignment: Alignment.center, // Align the task amount in the center
//             children: [
//               // Grey color for the rest
//               SimpleCircularProgressBar(
//                 startAngle: 90,
//                 progressColors: const [AppColors.primaryColor, Colors.grey],
//                 progressStrokeWidth: 20,
//                 backStrokeWidth: 20,
//                 animationDuration: 1,
//                 mergeMode: true,
//                 onGetText: (double value) {
//                   return Text('${value.toInt()}%');
//                 },
//
//               ),
//               // Progress 1
//               SimpleCircularProgressBar(
//                 radius: 100,
//                 progress: progress1,
//                 progressColor: color1,
//                 backgroundColor: Colors.transparent,
//                 strokeWidth: 5.0,
//               ),
//               // Progress 2
//               SimpleCircularProgressBar(
//                 radius: 100,
//                 progress: progress2,
//                 progressColor: color2,
//                 backgroundColor: Colors.transparent,
//                 strokeWidth: 5.0,
//               ),
//               Text(taskAmount,style: TextStyle(fontSize: 36),), // Display the task amount in the center
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround, // Spread the circles evenly
//             children: List.generate(circleTexts.length, (index) => Row( // Create a circle and text for each item in circleTexts
//               children: [
//                 Container(
//                   width: 20.0,
//                   height: 20.0,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: circleColors[index], // Use the color from circleColors
//                   ),
//                 ),
//                 SizedBox(width: 8.0), // Add some space between the circle and text
//                 Text(circleTexts[index]),
//               ],
//             )),
//           ),
//         ],
//       ),
//     );
//   }
// }
