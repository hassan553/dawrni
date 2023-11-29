import 'package:dawrni/core/paths/images_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final void Function()? onPressed;

  const CustomListTile(
      {super.key, required this.title, required this.onPressed});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: IconButton(
        onPressed: widget.onPressed,
        icon: SvgPicture.asset(ImagesPaths.lineDesignEdit),
      ),
    );
  }
}
