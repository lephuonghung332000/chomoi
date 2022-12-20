import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/pages/content_chat/viewmodels/content_chat_view_model.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMessageChat extends StatelessWidget {
  const CustomMessageChat({
    Key? key,
    required this.contentChatViewModel,
    this.imageSend,
    this.imageReceiver,
  }) : super(key: key);
  final ContentChatViewModel contentChatViewModel;
  final File? imageSend;
  final String? imageReceiver;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: contentChatViewModel.isOwnMessageChat
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 45,
              minWidth: 100,
            ),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: contentChatViewModel.isOwnMessageChat
                  ? AppColors.greenFog
                  : AppColors.white,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 30,
                      top: 5,
                      bottom: 28,
                    ),
                    child: Text(
                      contentChatViewModel.contentChat,
                      style: AppTextStyles.contentRegular15w400,
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 10,
                    child: Row(
                      children: [
                        Text(
                          contentChatViewModel.timeChat,
                          style: AppTextStyles.infoRegular13w400.copyWith(
                            color: AppColors.greyStorm,
                          ),
                        ),
                        if (contentChatViewModel.isOwnMessageChat) ...[
                          const HBox(5),
                          const Icon(
                            Icons.done_all,
                            size: 20,
                          ),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width / 1.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: contentChatViewModel.isOwnMessageChat
                    ? AppColors.greenCastleton.withOpacity(0.5)
                    : AppColors.greyStorm.withOpacity(0.5),
              ),
              child: Card(
                margin: const EdgeInsets.all(3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: contentChatViewModel.isOwnMessageChat
                    ? Image.file(imageSend!)
                    : CachedNetworkImage(
                        imageUrl: imageReceiver!,
                        errorWidget: (context, url, error) =>
                            const CupertinoActivityIndicator(),
                        placeholder: (context, url) =>
                            const CupertinoActivityIndicator(),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
