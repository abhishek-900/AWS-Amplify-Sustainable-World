import 'package:flutter/material.dart';

class PersistentImageCarouselHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  const PersistentImageCarouselHeaderDelegate({
    required this.carouselBuilder,
    required this.expandedHeight,
    required this.collapsedHeight,
  }) : super();

  final double expandedHeight;
  final double collapsedHeight;
  final Widget Function(BuildContext context, BoxConstraints constraints)
      carouselBuilder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) => carouselBuilder(context, constraints),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent ||
        oldDelegate.minExtent != minExtent;
  }
}
