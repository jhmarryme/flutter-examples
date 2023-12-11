import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfiguration {
  static final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: "home",
        path: "/",
        builder: (context, state) => Container(child: Text("home")),
      ),
    ],
  );
}
