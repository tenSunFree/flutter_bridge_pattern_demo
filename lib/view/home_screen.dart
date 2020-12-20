import 'package:flutter/material.dart';
import 'package:flutter_bridge_pattern_demo/common/model/content_bean.dart';
import 'package:flutter_bridge_pattern_demo/common/toast_util.dart';
import 'package:flutter_bridge_pattern_demo/model/menu_repository.dart';
import 'package:flutter_bridge_pattern_demo/model/roast_pork_storage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MenuRepository _repository;

  @override
  void initState() {
    super.initState();
    var _storage = RoastPorkStorage()..initList();
    _repository = MenuRepository(_storage);
  }

  @override
  Widget build(BuildContext context) {
    var _list = _repository.getContentBeanList();
    return Scaffold(
        body: Stack(children: <Widget>[
      SingleChildScrollView(
          child: Column(children: <Widget>[
        Image.asset('assets/icon_top_bar.png'),
        buildTitleContainer(),
        buildContentListView(_list),
        Image.asset('assets/icon_bottom_bar.png')
      ])),
      buildBottomBarAlign()
    ]));
  }

  Container buildTitleContainer() {
    return Container(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Row(children: [
            Text('${_repository.getTitle()}',
                style: TextStyle(color: Color(0xFF333333), fontSize: 24)),
            Expanded(child: SizedBox()),
            Text('${_repository.getMoney()}',
                style: TextStyle(color: Color(0xFF333333), fontSize: 16))
          ]),
          SizedBox(height: 12),
          Text('${_repository.getIntroduction()}',
              style: TextStyle(color: Color(0xFF888888), fontSize: 16)),
          SizedBox(height: 16),
          Container(color: Color(0x30767676), height: 1)
        ]));
  }

  ListView buildContentListView(List<ContentBean> _list) {
    return ListView.builder(
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${_repository.getContentBeanList()[index].getTitle()}',
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 20)),
                    Text('選一項',
                        style:
                            TextStyle(color: Color(0xFF888888), fontSize: 16)),
                    buildContentItemListView(_list, index)
                  ]));
        });
  }

  ListView buildContentItemListView(List<ContentBean> _list, int _index) {
    return ListView.builder(
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _list[_index].getContentItemBeanList().length,
        itemBuilder: (context, itemIndex) {
          return Container(
              child: RadioListTile(
                  activeColor: Color(0xFFD70F64),
                  selected: true,
                  value: _list[_index]
                      .getContentItemBeanList()[itemIndex]
                      .groupValue,
                  groupValue: _repository.getGroupValueList()[_index],
                  title: Text(
                      "${_list[_index].getContentItemBeanList()[itemIndex].title}"),
                  onChanged: (value) {
                    setState(() {
                      _repository.getGroupValueList()[_index] = value;
                    });
                  }));
        });
  }

  Align buildBottomBarAlign() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
            child: Image.asset('assets/icon_bottom_bar.png'),
            onTap: () {
              var msg = _repository.getShopCart();
              showToast(msg);
            }));
  }
}
