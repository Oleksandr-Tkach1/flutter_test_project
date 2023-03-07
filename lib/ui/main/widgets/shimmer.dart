import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_project/utils/colors.dart';

shimmerEffect() {
  return GridView.builder(
    padding: const EdgeInsets.only(left: 14, right: 14, top: 34),
    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    scrollDirection: Axis.vertical,
    itemCount: 10,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 3.0 / 4.0,
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      crossAxisCount: 2,
    ),
    itemBuilder: (BuildContext context, int index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Shimmer.fromColors(
            baseColor: AppColors.iconColor,
            highlightColor: Colors.white10,
            child: Container(color: Colors.white,)),
      );
    },
  );
}
