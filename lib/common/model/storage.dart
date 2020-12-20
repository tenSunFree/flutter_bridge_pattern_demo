import 'package:flutter_bridge_pattern_demo/common/model/content_bean.dart';

abstract class Storage {
  String getTitle();

  String getMoney();

  String getIntroduction();

  String getShopCart();

  initList();

  List<T> getContentBeanList<T extends ContentBean>();

  List<int> getGroupValueList();
}
