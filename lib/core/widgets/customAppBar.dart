// import 'package:dawrni/core/rescourcs/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

// void _handleMenuButtonPressed(advancedDrawerController) {
//   advancedDrawerController.showDrawer();
// }

// AppBar customAppBar(advancedDrawerController) {
//   return AppBar(
//     leading: null,
//     automaticallyImplyLeading: false,
//     title: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           width: 40,
//           height: 40,
//           margin: const EdgeInsetsDirectional.only(start: 5),
//           decoration: BoxDecoration(
//               color: AppColors.secondColor,
//               borderRadius: BorderRadius.circular(15)),
//           padding: const EdgeInsetsDirectional.all(1),
//           child: IconButton(
//             onPressed: () => _handleMenuButtonPressed(advancedDrawerController),
//             icon: ValueListenableBuilder<AdvancedDrawerValue>(
//               valueListenable: advancedDrawerController,
//               builder: (_, value, __) {
//                 return AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 250),
//                   child: value.visible
//                       ? Icon(
//                           Icons.clear,
//                           key: ValueKey<bool>(value.visible),
//                           size: 25,
//                         )
//                       : Image.asset('assets/Category.png'),
//                 );
//               },
//             ),
//           ),
//         ),
//         Container(
//           width: 40,
//           height: 40,
//           margin: const EdgeInsetsDirectional.only(start: 5),
//           decoration: BoxDecoration(
//               color: AppColors.secondColor,
//               borderRadius: BorderRadius.circular(15)),
//           padding: const EdgeInsetsDirectional.all(1),
//           child: const Icon(
//             Icons.notifications,
//             size: 25,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     ),
//   );
// }
