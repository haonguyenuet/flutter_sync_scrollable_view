import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sync_scrollable_list_tabs/src/view_models/detail_store_vm.dart';
import 'package:sync_scrollable_list_tabs/src/views/widgets/category_section.dart';
import 'package:sync_scrollable_list_tabs/src/views/widgets/category_tabs.dart';
import 'package:sync_scrollable_list_tabs/src/views/widgets/flexible_appbar.dart';
import 'package:sync_scrollable_list_tabs/src/views/widgets/rect_getter.dart';
import 'package:sync_scrollable_list_tabs/src/views/widgets/store_info.dart';

class DetailStoreScreen extends StatefulWidget {
  const DetailStoreScreen({Key? key}) : super(key: key);

  @override
  State<DetailStoreScreen> createState() => _DetailStoreScreenState();
}

class _DetailStoreScreenState extends State<DetailStoreScreen>
    with SingleTickerProviderStateMixin {
  late DetailStoreViewModel viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = context.read()..init(this);
  }

  @override
  void dispose() {
    viewmodel.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: viewmodel.onScrollNotification,
        child: RectGetter(
          globalKey: viewmodel.scrollViewKey,
          child: buildScrollView(),
        ),
      ),
    );
  }

  CustomScrollView buildScrollView() {
    return CustomScrollView(
      controller: viewmodel.scrollViewController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const FlexibleAppbar(),
        SliverPersistentHeader(
          delegate: StoreInfo(),
        ),
        verticalSpace,
        SliverPersistentHeader(
          pinned: true,
          delegate: CategoryTabs(),
        ),
        verticalSpace,
        buildSliverCategoryList(),
      ],
    );
  }

  SliverList buildSliverCategoryList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final categorySectionKeys = viewmodel.categorySectionKeys;
          categorySectionKeys[index] = GlobalKey();
          return RectGetter(
            globalKey: categorySectionKeys[index]!,
            child: AutoScrollTag(
              key: ValueKey(index),
              index: index,
              controller: viewmodel.scrollViewController,
              child: CategorySection(category: viewmodel.categories[index]),
            ),
          );
        },
        childCount: viewmodel.categories.length,
      ),
    );
  }

  get verticalSpace => const SliverToBoxAdapter(child: SizedBox(height: 10));
}
