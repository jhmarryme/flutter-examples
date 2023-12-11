part of '../go_router_configuration.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = Get.key;
final GlobalKey<NavigatorState>? _homeSectionNavigatorKey =
    Get.nestedKey("sectionANav");
final GlobalKey<NavigatorState>? _profileSectionNavigatorKey =
    Get.nestedKey("profileSectionNav");

// final GlobalKey<NavigatorState> _rootNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'root');
// final GlobalKey<NavigatorState> _homeSectionNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
// final GlobalKey<NavigatorState> _profileSectionNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'profileSectionNav');
