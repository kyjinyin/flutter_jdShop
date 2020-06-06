import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdaper{
  static init(context){
    ScreenUtil.init(context, width: 750, height: 1334);
  }

  //获取计算后的宽高度
  static height(double value){
    return ScreenUtil().setHeight(value);
  }
  static width(double value){
    return ScreenUtil().setWidth(value);
  }
  //获取当前身背的高度Dp 宽度
  static getScreenHeight(){
    return ScreenUtil.screenHeightDp;
  }
  static getScreenWidth(){
    return ScreenUtil.screenWidthDp;
  }
}