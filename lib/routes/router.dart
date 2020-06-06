//import 'dart:js';

import 'package:flutter/material.dart';
import '../pages/tabs/Tabs.dart';
import '../pages/Search.dart';

final routes = {
  "/":(context) => Tabs(),
  "/search":(context) => SearchPage(),
};
var onGeneratRoute = (RouteSettings setting){
  final String name = setting.name;
  final Function pageContentBuilder = routes[name];
  if(pageContentBuilder != null){
    if(setting.arguments != null){
      final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context,arguments:setting.arguments)
      );
      return route;
    }else {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context)
      );
      return route;
    }
  }
};
