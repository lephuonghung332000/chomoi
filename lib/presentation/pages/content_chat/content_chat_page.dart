import 'package:agora_rtc_engine/rtc_local_view.dart';
import 'package:agora_rtc_engine/rtc_remote_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/controllers/content_chat/content_chat_controller.dart';
import 'package:chomoi/presentation/pages/content_chat/viewmodels/content_chat_view_model.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:chomoi/presentation/widgets/content_chat/custom_message_chat.dart';
import 'package:chomoi/presentation/widgets/hbox.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtcremote;
import 'package:agora_rtc_engine/rtc_local_view.dart' as rtclocal;
import 'package:get/get.dart';

class ContentChatPage extends GetView<ContentChatController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.secondaryBackgroundColor,
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(AppConstant.heightAppBarWithoutSearchBar),
          child: _buildHeader,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  controller: controller.scrollController,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [_buildListChat],
                ),
              ),
              _buildChatBox(context),
            ],
          ),
        ),
      ),
    );
  }

  // Display remote user's video
  Widget get _remoteVideo {
    if (controller.remoteUid != 0) {
      return rtcremote.SurfaceView(
        uid: controller.remoteUid,
        channelId: '',
      );
    } else {
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget get _buildListChat => GetX<ContentChatController>(
        builder: (controller) {
          return SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CustomMessageChat(
                    contentChatViewModel: ContentChatViewModel.fromLocal(
                      controller.messages[index],
                    ),
                  );
                },
                childCount: controller.messages.length,
              ),
            ),
          );
        },
      );

  Widget _buildChatBox(BuildContext context) => GetX<ContentChatController>(
        builder: (controller) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: controller.isEmptyChat &&
                        controller.selectedFile.path.isEmpty
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width - 50,
                padding: EdgeInsets.only(
                    top: 15,
                    right: 5,
                    left: 5,
                    bottom: controller.selectedFile.path.isEmpty ? 15 : 0),
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: false,
                      onChanged: controller.onChange,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.chatController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        hintText: AppStrings.send_chat_hint_text,
                        hintStyle: AppTextStyles.infoRegular13w400.copyWith(
                          color: AppColors.greyStorm,
                        ),
                        fillColor: controller.selectedFile.path.isEmpty
                            ? AppColors.white
                            : AppColors.grayPlatinum,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: controller.selectedFile.path.isEmpty
                              ? BorderRadius.circular(25)
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.zero,
                                  bottomRight: Radius.zero,
                                ),
                          borderSide: const BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: controller.selectedFile.path.isEmpty
                              ? BorderRadius.circular(25)
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.zero,
                                  bottomRight: Radius.zero,
                                ),
                          borderSide: controller.selectedFile.path.isEmpty
                              ? const BorderSide(color: AppColors.greyCloud)
                              : const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: controller.selectedFile.path.isEmpty
                              ? BorderRadius.circular(25)
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.zero,
                                  bottomRight: Radius.zero,
                                ),
                          borderSide: controller.selectedFile.path.isEmpty
                              ? const BorderSide(color: AppColors.greyCloud)
                              : const BorderSide(color: Colors.transparent),
                        ),
                        suffixIcon: controller.selectedFile.path.isEmpty
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.attach_file,
                                        color: AppColors.grayLight),
                                    onPressed: () =>
                                        Get.bottomSheet(bottomSheet),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.camera_alt,
                                        color: AppColors.grayLight),
                                    onPressed: () =>
                                        controller.selectImagesFromCamera(),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ),
                    ),
                    if (controller.selectedFile.path.isEmpty)
                      const SizedBox()
                    else
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.grayPlatinum,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.zero,
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: buildAddImageSmall,
                            ),
                            const HBox(10),
                            Expanded(
                              child: _buildSelectedImage,
                            ),
                            const Spacer(
                              flex: 3,
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              if (controller.isEmptyChat &&
                  controller.selectedFile.path.isEmpty)
                const SizedBox()
              else
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () => controller.sendMessage(),
                  ),
                ),
            ],
          );
        },
      );

  Widget get _buildSelectedImage => GetX<ContentChatController>(
        builder: (controller) {
          return controller.selectedFile.path.isNotEmpty
              ? Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.file(
                        controller.selectedFile,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => controller.removeImage(),
                        child: const SvgIcon(
                          icon: AppAssets.iconCancelCircle,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox();
        },
      );

  Widget get buildAddImageSmall => GestureDetector(
        onTap: () => Get.bottomSheet(bottomSheet),
        child: DottedBorder(
          color: AppColors.primaryColor,
          strokeWidth: 1,
          dashPattern: const [3, 2],
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              padding: const EdgeInsets.all(10),
              child: const SvgIcon(
                size: 2,
                icon: AppAssets.iconCameraAdd,
              ),
            ),
          ),
        ),
      );

  Widget get bottomSheet => Container(
        height: AppConstant.heightBottomSheet,
        child: Card(
          margin: const EdgeInsets.all(18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    iconCreation(Icons.insert_drive_file, Colors.indigo,
                        AppStrings.document_text),
                    iconCreation(
                        Icons.camera_alt, Colors.pink, AppStrings.camera_text,
                        onTap: () => controller.selectImagesFromCamera()),
                    iconCreation(Icons.insert_photo, Colors.purple,
                        AppStrings.gallery_text,
                        onTap: () => controller.selectImageFromGallery()),
                  ],
                ),
                const VBox(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    iconCreation(
                        Icons.headset, Colors.orange, AppStrings.audio_text),
                    iconCreation(
                      Icons.location_pin,
                      Colors.teal,
                      AppStrings.location_text,
                    ),
                    iconCreation(
                        Icons.person, Colors.blue, AppStrings.contact_text),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget iconCreation(IconData icons, Color color, String text,
      {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: AppConstant.iconBottomSheetSize,
            backgroundColor: color,
            child: Icon(
              icons,
              size: AppConstant.iconBottomSheetSize,
              color: Colors.white,
            ),
          ),
          const VBox(8),
          Text(
            text,
            style: AppTextStyles.smallRegular11w400,
          )
        ],
      ),
    );
  }

  Widget get _buildHeader => Container(
        color: AppColors.primaryColor,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            GetX<ContentChatController>(
              builder: (controller) {
                return Flexible(
                  child: Row(
                    children: [
                      AppBackButton(
                        onBack: () => Get.back(),
                      ),
                      const HBox(5),
                      CircleAvatar(
                        radius: AppConstant.iconAvatarBoxSize,
                        backgroundImage:
                            CachedNetworkImageProvider(controller.avatar),
                        backgroundColor: Colors.transparent,
                      ),
                      const HBox(10),
                      IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                controller.name,
                                style: AppTextStyles.infoMedium13w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const VBox(5),
                            const FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Đang hoạt động',
                                style: AppTextStyles.smallRegular11w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
                IconButton(icon: const Icon(Icons.call), onPressed: () {}),
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  onPressed: () {},
                  child: const SvgIcon(
                    size: 16,
                    icon: AppAssets.iconMore,
                  ),
                )
              ],
            )
          ],
        ),
      );
}
