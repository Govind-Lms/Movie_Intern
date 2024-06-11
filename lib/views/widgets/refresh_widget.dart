import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshWidget<T> extends StatelessWidget {
  final RefreshController refreshController;
  final List<T> items;
  final Function? onLoading;
  final Function? onRefresh;
  final bool enablePullUp;
  final Widget Function(T) child;
  const RefreshWidget({super.key, required this.refreshController,  this.onLoading,  this.onRefresh, this.enablePullUp = false, required this.items, required this.child});

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      onLoading: ()=> onLoading?.call(),
      onRefresh: ()=> onRefresh?.call(),
      enablePullUp: enablePullUp,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return child(item);
        },
      ),
    );
  }
}