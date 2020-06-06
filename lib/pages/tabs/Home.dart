import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../service/screenAdaper.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //轮播图
  Widget _swiperWidget(){
    List<Map> imgList = [
      {"url":"http://47.94.89.73:8080/zeefile/audio/banner/images/banner/banner1.png"},
      {"url":"http://47.94.89.73:8080/zeefile/audio/banner/images/banner/banner2.png"},
      {"url":"http://47.94.89.73:8080/zeefile/audio/banner/images/banner/banner3.png"},
    ];
    return Container(
      child: AspectRatio(
        aspectRatio: 2/1,
        child:  Swiper(
          itemBuilder: (BuildContext context,int index){
            return new Image.network(
              imgList[index]["url"],
              fit: BoxFit.fill,
            );
          },
          /*Flutter Swiper是一个轮播图组件，
           内部包含一个Widget List，
          当这个Widget List数量发生变化的时候如果出现类似这种异常情况导致轮播图不滑动或者其他红屏等错误
          */
          key: UniqueKey(),
          itemCount: imgList.length,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
          autoplay: true,
        )  ,
      ),
    );
  }
  //标题
  Widget _titleWidget(value){
    return Container(
      height:ScreenUtil().setHeight(36),
      margin:EdgeInsets.only(left: ScreenAdaper.width(20)),
      padding:EdgeInsets.only(left: ScreenAdaper.width(20)),
      decoration: BoxDecoration(
        border:Border(
          left:BorderSide(
            color: Colors.red,
            width:ScreenAdaper.width(8),
          )
        )
      ),
      child: Text(value,style: TextStyle(
        color:Colors.black54,
      ),),
    );
  }

  //热门商品
  Widget _hotProductListWidget() {
    return Container(
      height: ScreenAdaper.height(234),
      padding: EdgeInsets.all(ScreenAdaper.width(20)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,  //横向滚动
        itemBuilder: (contxt, index) {
          return Column(
            children: <Widget>[
              Container(
                height: ScreenAdaper.height(140),
                width: ScreenAdaper.width(140),
                margin: EdgeInsets.only(right: ScreenAdaper.width(21)),
                child: Image.network(
                    "http://47.94.89.73:8080/zeefile/audio/banner/images/banner/banner${index + 1}.png",
                    fit: BoxFit.cover),
              ),
              Container(
                padding: EdgeInsets.only(top: ScreenAdaper.height(10)),
                height: ScreenAdaper.height(44),
                child: Text("第${index}条"),
              )
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }


  //商品列表
  Widget _recproductItemListWeight(){
    var itemWidth = (ScreenAdaper.getScreenWidth()-30) / 2;
    return Container(
      padding: EdgeInsets.all(ScreenAdaper.width(10)),
      width:itemWidth,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1,
        )
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,  //宽度自适应
              child:Image.network('http://47.94.89.73:8080/zeefile/audio/banner/images/banner/banner1.png',fit: BoxFit.cover,) //平铺
          ),
          Padding( //padding组件 直接设置padiinga
            padding:EdgeInsets.only(top:ScreenAdaper.width(10)),
            child:Text(
              '啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:ScreenAdaper.width(10)),
              child:Stack(
                children: <Widget>[
                  Align(
                    alignment:Alignment.centerLeft, //靠近左边
                    child: Text('￥188.00',
                    style:TextStyle(
                      color: Colors.red,
                      fontSize: 16
                    ) ,
                    ),
                  ),
                  Align(
                    alignment:Alignment.centerRight, //靠近左边
                    child: Text('￥198.00',
                      style:TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                      ) ,
                    ),
                  ),
                ],
              )
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    //设计稿  的尺寸
    ScreenAdaper.init(context);
//    ScreenUtil.init(context, width: 750, height: 1334);
    //这是首页的内容
    return ListView(
      children: <Widget>[
        _swiperWidget(),
        //设置上下间距 10
        SizedBox(height:ScreenAdaper.height(10)),
        _titleWidget("猜你喜欢"),
        SizedBox(height:ScreenAdaper.height(10)),
        _hotProductListWidget(),
        _titleWidget("热门推荐"),
        Container(
          padding:EdgeInsets.all(ScreenAdaper.width(10)), //整个盒子四周padding
          child:Wrap(
            runSpacing: 10, //主轴
            spacing: 10,  //垂直
            children: <Widget>[
              _recproductItemListWeight(),
              _recproductItemListWeight(),
              _recproductItemListWeight(),
              _recproductItemListWeight(),
              _recproductItemListWeight(),
              _recproductItemListWeight(),
            ],
          )
        )
        //listview 不能直接包含listview 需要建一个container
      ],
//      textDirection:TraversalDirection.right,
    );
  }
}
