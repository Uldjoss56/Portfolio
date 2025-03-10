import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.imgPath,
    required this.subtitle,
    this.circleAvatarRadius,
  });
  final double? circleAvatarRadius;
  final String imgPath;
  final String title;
  final String subtitle;
  @override
  State<StatefulWidget> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: widget.circleAvatarRadius ?? 55,
          child: ClipOval(
            child: AspectRatio(
              aspectRatio: 1,
              child: imageAsset(
                widget.imgPath,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                widget.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                "compte contributeur",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
