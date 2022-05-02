import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sync_scrollable_list_tabs/src/constant/style_constant.dart';
import 'package:sync_scrollable_list_tabs/src/view_models/detail_store_vm.dart';

const categoryTabsHeight = 50.0;

class CategoryTabs extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final viewmodel = context.read<DetailStoreViewModel>();

    final categories = viewmodel.categories;
    if (categories.isEmpty) {
      return const SizedBox(height: categoryTabsHeight);
    }
    return Container(
      height: categoryTabsHeight,
      color: Colors.white,
      child: TabBar(
        isScrollable: true,
        controller: viewmodel.tabController,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 15.0),
        indicatorColor: kPrimaryColor,
        labelColor: kPrimaryColor,
        unselectedLabelColor: Colors.black54,
        indicatorWeight: 2.0,
        tabs: List.generate(
          categories.length,
          (index) => Tab(text: categories[index].name.toUpperCase()),
        ),
        onTap: (index) => viewmodel.onTapCategoryTab(index),
      ),
    );
  }

  @override
  double get maxExtent => categoryTabsHeight;

  @override
  double get minExtent => categoryTabsHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
