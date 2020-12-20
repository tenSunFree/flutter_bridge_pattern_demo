import 'package:flutter_bridge_pattern_demo/common/model/content_item_bean.dart';

abstract class ContentBean {
  String getTitle();

  List<T> getContentItemBeanList<T extends ContentItemBean>();
}
