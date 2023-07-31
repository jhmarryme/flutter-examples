import 'package:flutter/material.dart';

/// 加载进度条组件
class LoadingContainer extends StatelessWidget {
  final bool isLoading;

  final Widget child;

  /// 是否覆盖显示
  final bool? cover;

  const LoadingContainer({
    Key? key,
    required this.isLoading,
    required this.child,
    this.cover = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (cover ?? false)
        ? (isLoading ? Stack(children: [child, _loadingView()]) : child)
        : (isLoading ? _loadingView() : child);
  }

  Widget _loadingView() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
