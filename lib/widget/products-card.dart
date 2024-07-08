import 'package:andima_shop/utils/the.data.dart';
import 'package:andima_shop/utils/widget_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app-card.dart';
import 'apptexts.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.image, required this.price, required this.i, required this.name, required this.description, required this.colors, required this.margin, this.onTap, this.favourite, this.isLiked = false,
  });

  final String image;
  final List<num> price;
  final bool isLiked;
  final EdgeInsets margin;
  final VoidCallback? onTap;
  final VoidCallback? favourite;
  final String name;
  final String description;
  final int i;
  final List<String> colors;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: widget.onTap,
      borderWidth: 0.3.sp,
      margin: widget.margin,
      padding: 0.0.padA,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.sp),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                width: width(context),
                alignment: Alignment.bottomLeft,
                child: Hero(
                  tag: widget.image,
                  child: CachedNetworkImage(
                    width: width(context),
                    imageUrl: widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: 8.sp.padA,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: AppText(widget.name, isBold: true, maxLine: 1, align: TextAlign.start, size: 16.sp,)),
                      ],
                    ),
                    10.sp.sbH,
                    Expanded(child: AppText(widget.description, weight: FontWeight.w400, maxLine: 3, align: TextAlign.start, size: 12.sp,)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(top: 3, left: 3, bottom: 3),
                            child: AppText(widget.price.isEmpty? "NGN 0": "NGN ${widget.price.first.toString()}", weight: FontWeight.w700, maxLine: 1, align: TextAlign.start, size: 13.sp)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}