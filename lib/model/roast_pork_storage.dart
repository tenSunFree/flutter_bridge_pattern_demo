import 'package:flutter_bridge_pattern_demo/common/model/content_bean.dart';
import 'package:flutter_bridge_pattern_demo/common/model/storage.dart';
import 'package:flutter_bridge_pattern_demo/model/main_food_content_bean.dart';
import 'package:flutter_bridge_pattern_demo/model/meat_volume_content_bean.dart';

class RoastPorkStorage implements Storage {
  var contentBeanList;
  var groupValueList;

  @override
  String getTitle() {
    return '鹽蔥燒肉丼';
  }

  @override
  String getMoney() {
    return '\$190起';
  }

  @override
  String getIntroduction() {
    return "獨家鹽葱提出海鹽鹹香與美味葱甜搭配燒肉切割壓成3mm最適入口厚度，無敵開胃(附糖心蛋乙顆)";
  }

  @override
  initList() {
    contentBeanList = List<ContentBean>();
    contentBeanList.add(MainFoodContentBean());
    contentBeanList.add(MeatVolumeContentBean());
    groupValueList = List<int>(contentBeanList.length);
  }

  @override
  List<T> getContentBeanList<T extends ContentBean>() {
    return contentBeanList;
  }

  @override
  List<int> getGroupValueList() {
    return groupValueList;
  }

  @override
  String getShopCart() {
    var shopCart = "";
    var count = 0;
    for (var bean in contentBeanList) {
      var groupValue = groupValueList[count];
      shopCart = shopCart +
          "${bean.getTitle()}: ${bean.getContentItemBeanList()[groupValue].title}, ";
      count++;
    }
    return shopCart;
  }
}
