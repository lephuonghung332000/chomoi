import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/constant/app_url_constant.dart';
import 'package:chomoi/app/util/url_launcher.dart';
import 'package:chomoi/domain/models/response/ads/ads_model.dart';
import 'package:chomoi/package/carousel.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  final List<AdsModel> ads;

  const HomeCarousel({required this.ads});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstant.heightAppBarCarousel,
      child: Carousel(
        overlayShadow: false,
        borderRadius: true,
        boxFit: BoxFit.none,
        radius: const Radius.circular(0),
        autoplay: true,
        dotSize: 4,
        images: ads
            .map(
              (e) => e.image.isNotEmpty
                  ? GestureDetector(
                      onTap: e.image.isNotEmpty
                          ? () => UrlLauncher.openUrl(e.url)
                          : null,
                      child: Image.network(
                        e.image,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Image.network(
                      AppUrlConstant.imageNoData,
                    ),
            )
            .toList(),
      ),
    );
  }
}
