
import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerLocation extends StatefulWidget {
  const ContainerLocation({super.key});

  @override
  State<ContainerLocation> createState() => _ContainerLocationState();
}

class _ContainerLocationState extends State<ContainerLocation> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
        width: 348,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(16 )  ,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(ImagesPaths.locationIcon),
            IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(ImagesPaths.profDone))
          ],
        ),
      ),
    );
  }
}



  