import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../const.dart';

class BannerCard extends StatelessWidget {
  final String imagesUrl;


  const BannerCard({
    Key? key, required this.imagesUrl,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child:CachedNetworkImage(
          imageUrl: '$baseUrl$imagesUrl',
          progressIndicatorBuilder: (context,url, downloadProgress) =>
              Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey.shade300,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
          fit: BoxFit.cover,
          width: double.infinity,
        )
      ),
    );
  }
}
