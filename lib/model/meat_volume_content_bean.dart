import 'package:flutter_bridge_pattern_demo/common/model/content_bean.dart';
import 'package:flutter_bridge_pattern_demo/common/model/content_item_bean.dart';

class MeatVolumeContentBean extends ContentBean {
  @override
  String getTitle() {
    return "肉量加倍";
  }

  @override
  List<T> getContentItemBeanList<T extends ContentItemBean>() {
    var list = List<ContentItemBean>();
    list.add(MeatVolumeContentItemBean(
        groupValue: 0, isSelected: false, title: "肉量加倍", money: "+\$100"));
    return list;
  }
}

class MeatVolumeContentItemBean extends ContentItemBean {
  MeatVolumeContentItemBean(
      {int groupValue, bool isSelected, String title, String money})
      : super(groupValue, isSelected, title, money);
}
