import 'package:flutter_bridge_pattern_demo/common/model/content_bean.dart';
import 'package:flutter_bridge_pattern_demo/common/model/content_item_bean.dart';

class MainFoodContentBean extends ContentBean {
  @override
  String getTitle() {
    return "主食選擇";
  }

  @override
  List<T> getContentItemBeanList<T extends ContentItemBean>() {
    var list = List<ContentItemBean>();
    list.add(MainFoodContentItemBean(
        groupValue: 0, isSelected: false, title: "牛", money: "+\$0"));
    list.add(MainFoodContentItemBean(
        groupValue: 1, isSelected: false, title: "豚", money: "+\$0"));
    return list;
  }
}

class MainFoodContentItemBean extends ContentItemBean {
  MainFoodContentItemBean(
      {int groupValue, bool isSelected, String title, String money})
      : super(groupValue, isSelected, title, money);
}
