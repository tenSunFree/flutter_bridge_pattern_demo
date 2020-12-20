import 'package:flutter_bridge_pattern_demo/common/model/content_bean.dart';
import 'package:flutter_bridge_pattern_demo/common/model/repository.dart';
import 'package:flutter_bridge_pattern_demo/common/model/storage.dart';

class MenuRepository extends Repository {
  final Storage storage;

  MenuRepository(this.storage);

  @override
  String getTitle() {
    return storage.getTitle();
  }

  @override
  String getMoney() {
    return storage.getMoney();
  }

  @override
  String getIntroduction() {
    return storage.getIntroduction();
  }

  @override
  String getShopCart() {
    return storage.getShopCart();
  }

  @override
  List<T> getContentBeanList<T extends ContentBean>() {
    return storage.getContentBeanList();
  }

  @override
  List<int> getGroupValueList() {
    return storage.getGroupValueList();
  }
}
