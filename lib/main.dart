//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'pages/tabs/Tabs.dart';
import 'routes/router.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //标题
//      title: 'flutter Demo',
//      theme:ThemeData(
//        primarySwatch: Colors.blue,
//      ),
        home:Tabs(),
    //配置根路径我
    initialRoute: "/",
    //引进路由
    onGenerateRoute: onGeneratRoute,
    );
  }
}
