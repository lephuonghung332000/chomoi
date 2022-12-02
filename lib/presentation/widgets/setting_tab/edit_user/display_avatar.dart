import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:flutter/material.dart';

class DisplayAvatar extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final File file;

  // Constructor
  const DisplayAvatar({
    Key? key,
    required this.imagePath,
    required this.onTap,
    required this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildImage;
  }

  // Builds Profile Image
  Widget get _buildImage {
    return CircleAvatar(
      radius: AppConstant.iconAvatarSettingSize,
      backgroundImage: file.path.isNotEmpty
          ? FileImage(file) as ImageProvider
          : CachedNetworkImageProvider(imagePath),
      backgroundColor: Colors.transparent,
      child: _buildEditIcon,
    );
  }

  // Builds Edit Icon on Profile Picture
  Widget get _buildEditIcon => Stack(children: [
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: onTap,
            child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.camera,
                  color: AppColors.black,
                ) // change this children
                ),
          ),
        ),
      ]);
}
