// import 'package:flutter/material.dart';
// import 'colors gradient_page.dart';
//
// class SideMenu3D extends StatelessWidget {
//   const SideMenu3D({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Colors.transparent,
//       child: Container(
//         width: 260,
//         padding: const EdgeInsets.all(20),
//         decoration: const BoxDecoration(
//           color: AppColors.cardDark,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(40),
//             bottomRight: Radius.circular(40),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const CircleAvatar(
//               radius: 35,
//               backgroundImage: AssetImage("assets/profile.jpg"),
//             ),
//             const SizedBox(height: 15),
//
//             const Text(
//               "Alice Portman",
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//             const SizedBox(height: 30),
//
//             menuItem(Icons.credit_card, "Payment"),
//             menuItem(Icons.translate, "Translate"),
//             menuItem(Icons.lock_outline, "Privacy"),
//             menuItem(Icons.history, "History"),
//             menuItem(Icons.home_outlined, "Host"),
//
//             const Spacer(),
//
//             menuItem(Icons.dark_mode, "Dark Mode"),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget menuItem(IconData icon, String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 22),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.white70, size: 22),
//           const SizedBox(width: 16),
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white, fontSize: 15),
//           ),
//         ],
//       ),
//     );
//   }
// }
