import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sync_scrollable_list_tabs/src/data/raw_data.dart';
import 'package:sync_scrollable_list_tabs/src/views/widgets/flexible_appbar.dart';
import 'package:sync_scrollable_list_tabs/src/views/widgets/rect_getter.dart';

class DetailStoreViewModel extends ChangeNotifier {
  late AutoScrollController scrollViewController;
  late TabController tabController;

  final categories = rawCategories;
  final scrollViewKey = GlobalKey();
  final categorySectionKeys = <int, GlobalKey>{};

  var preventScrolling = false;
  var collapseAppbar = false;

  void init(TickerProvider provider) {
    scrollViewController = AutoScrollController();
    tabController = TabController(length: categories.length, vsync: provider);

    scrollViewController.addListener(() {
      final scrollViewOffset = scrollViewController.position.pixels;
      final isCollapse = scrollViewOffset < flexibleAppbarHeight - 40;
      if (collapseAppbar != isCollapse) {
        collapseAppbar = isCollapse;
        notifyListeners();
      }
    });
  }

  List<int> getVisibleCategoryIndexs() {
    final scrollViewRect = RectGetter.getRectFromKey(scrollViewKey);
    if (scrollViewRect == null) return List.empty();

    var categorySectionIndexs = <int>[];
    categorySectionKeys.forEach((index, key) {
      final categorySectionRect = RectGetter.getRectFromKey(key);
      if (categorySectionRect == null) return;
      if (categorySectionRect.top > scrollViewRect.bottom) return;
      if (categorySectionRect.bottom < scrollViewRect.top) return;
      categorySectionIndexs.add(index);
    });
    return categorySectionIndexs;
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (preventScrolling) return true;
    final lastTabIndex = tabController.length - 1;
    final visibleItems = getVisibleCategoryIndexs();

    final reachLastTabIndex = visibleItems.isNotEmpty &&
        visibleItems.length <= 2 &&
        visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      tabController.animateTo(lastTabIndex);
    } else if (visibleItems.isNotEmpty) {
      final sumIndex = visibleItems.reduce((value, element) => value + element);
      final middleIndex = sumIndex ~/ visibleItems.length;
      if (tabController.index != middleIndex) {
        tabController.animateTo(middleIndex);
      }
    }
    return false;
  }

  void onTapCategoryTab(int index) {
    preventScrolling = true;
    tabController.animateTo(index);
    scrollViewController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .then((value) => preventScrolling = false);
  }

  void destroy() {
    tabController.dispose();
    scrollViewController.dispose();
  }
}
