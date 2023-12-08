import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_network_image.dart';
import 'package:flutter/material.dart';

class ProfileTopWidget extends StatelessWidget {
  final String image;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const ProfileTopWidget({Key? key, required this.image, required this.onEdit, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 150,
          margin: const EdgeInsets.only(bottom: 70),
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius:
              BorderRadius.vertical(bottom: Radius.elliptical(150, 50))),
        ),
        Positioned(
              top: 80,
              height: 140,
              width: 140,
              child: Stack(
                children: [
                  (image.isEmpty) ? Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 140,
                    ),
                  ) : AppNetworkImage(
                    url: image,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: IconButton(
                          onPressed: onEdit,
                          icon: const Icon(Icons.edit, color: AppColors.primaryColor)),
                    ),
                  ),
                  if(image.isNotEmpty)
                    PositionedDirectional(
                      bottom: 0,
                      start: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: IconButton(
                            onPressed: onDelete,
                            icon: const Icon(Icons.remove, color: Colors.red)),
                      ),
                    ),
                ],
              )),
      ],
    );
  }
}
