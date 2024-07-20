// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: AppBar(
//           title: Row(
//             children: [
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.waving_hand,
//                         color: Colors.amber,
//                         size: 15,
//                       ),
//                       Text(
//                         "Hello",
//                         style: TextStyle(color: Colors.amber, fontSize: 12),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [Text("Steve Jone")],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         "Loream ipsum dolor sit amit",
//                         style: TextStyle(fontSize: 12),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               Column(
                
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: CircleAvatar(
//                       radius: 25,
//                       backgroundColor: Colors.white,
//                       child: Image.asset(
//                         'assets/images/person.jpg',
//                         height: 50,
//                         width: 50,
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
// import 'package:tpage/mainpage.dart';
import 'package:tpage/shoes.dart';
 void main(){
  runApp(MyApp());
 }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    //  home: mainpage(),
     home:Shoes()
    );
  }
}