import 'dart:io';

import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';
import 'package:portfolio/core/widgets/img_wid.dart';
import 'package:flutter/material.dart';

class OtherFileChosenTile extends StatefulWidget {
  const OtherFileChosenTile({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<StatefulWidget> createState() => _OtherFileChosenTileState();
}

class _OtherFileChosenTileState extends State<OtherFileChosenTile> {
  File? _chosenFile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: CustomBlurContainer(
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              if (_chosenFile != null)
                Row(
                  children: [
                    imageAsset(
                      "assets/img/icons/validate_file.png",
                      width: 20,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              Expanded(
                child: Text(
                  "choisissez le fichier pour ${widget.title}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Text(
                    "",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: myTurquois,
                        ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              // I comment it now to perform it later
              /*
                Row(
                  children: [
                    DropdownButton(
                      value: _selectedFile3dType,
                      items: _file3dTypes.map((e) {
                        return DropdownMenuItem(
                          value: e.file3dFormatId,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 0.6 * width),
                            child: Text(
                              e.fileExtension ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: myOrange,
                                  ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedFile3dType = value;
                          widget.onChooseType(_selectedFile3dType!);
                        });
                      },
                      underline: const SizedBox(),
                      dropdownColor:
                          isDarkMode ? myBlueBackgroundAA : myWhiteAA,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_rounded,
                      ),
                    ),
                  ],
                ),
              */
            ],
          ),
        ),
      ),
    );
  }
}
