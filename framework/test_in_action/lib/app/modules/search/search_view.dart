import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/business/placeholder_root_view.dart';
import 'package:test_in_action/app/modules/search/search_home/search_home_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceholderRootView(
        fixedContent: SearchHomeView(),
        dynamicContent: child,
      ),
    );
  }
}
