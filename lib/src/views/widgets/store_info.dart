import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sync_scrollable_list_tabs/src/constant/style_constant.dart';

const storeInfoHeight = 100.0;

class StoreInfo extends SliverPersistentHeaderDelegate {
  StoreInfo();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 2,
                ),
                color: kPrimaryColor,
                child: const Text(
                  "Preferred",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Second Home Cafe".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "Số 33, Ngõ 26, Vương Thừa Vũ, Hà Nội",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              RatingBar.builder(
                initialRating: 4,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                ignoreGestures: true,
                itemBuilder: (_, int value) {
                  return Icon(
                    value < 4 ? Icons.star_rate : Icons.star_rate_outlined,
                    color: kPrimaryColor,
                  );
                },
                itemSize: 22,
                unratedColor: kPrimaryColor,
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(width: 5),
              const Text(
                "4.8 (999+ Reviews)",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => storeInfoHeight;

  @override
  double get minExtent => storeInfoHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
