import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sync_scrollable_list_tabs/src/constant/style_constant.dart';
import 'package:sync_scrollable_list_tabs/src/data/raw_data.dart';
import 'package:sync_scrollable_list_tabs/src/view_models/detail_store_vm.dart';

const flexibleAppbarHeight = 200.0;

class FlexibleAppbar extends StatelessWidget {
  const FlexibleAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailStoreViewModel>(
      builder: (_, viewmodel, __) {
        final isTrigger = viewmodel.collapseAppbar;
        return SliverAppBar(
          expandedHeight: flexibleAppbarHeight,
          pinned: true,
          stretch: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: AnimatedSwitcher(
            duration: kDuration,
            child: IconButton(
              icon: Icon(
                Icons.adaptive.arrow_back,
                size: 24,
                color: isTrigger ? Colors.white : Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          title: isTrigger
              ? null
              : Text(
                  "Second Home Cafe".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: 24,
                color: isTrigger ? Colors.white : Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.adaptive.share,
                size: 24,
                color: isTrigger ? Colors.white : Colors.black,
              ),
              onPressed: () {},
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Image.asset(
              bannerImage,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
