import 'package:flutter/material.dart';
import 'Home.dart';
import 'Category.dart';
import 'Cart.dart';
import 'User.dart';
class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  //定义初始选中的索引
  int _currentIndex = 0;
  //定义页面列表
  List _pageList=[
    HomePage(),
    CategoryPage(),
    CartPage(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jdshop"),
        centerTitle: true,
      ),
      body:this._pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //当前选中的索引
        currentIndex: this._currentIndex,
        //tab切换的事件
        onTap: (index){
          setState(() {
            this._currentIndex = index;
          });
        },
        //四个以上需要配置type
        type:BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              icon:Icon(Icons.home),
              title:Text("首页")
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.category),
              title:Text("分类")
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.shopping_cart),
              title:Text("购物车")
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.people),
              title:Text("我的")
          ),
        ],
      ),
    );
  }
}
