// Flutter imports:
import 'package:delivery_system/views/models/menu.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';

// Project imports:
import 'package:delivery_system/views/models/order.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderListPage extends HookWidget {
  final order1 = Order(
    1,
    '吉田 拓磨様',
    'Uber Eats',
    [Menu('ハンバーガー', 1, 200)],
    Status.cooking,
    200,
    20,
  );

  final order2 = Order(
    2,
    '伊藤 絵里様',
    '出前館',
    [Menu('チーズバーガー', 2, 200), Menu('コーラ', 1, 100)],
    Status.unchecked,
    500,
    50,
  );

  Widget _orderCard({
    required Order order,
    required BuildContext context,
  }) {
    return Flexible(
      flex: 4,
      child: InkWell(
        onTap: () async => _showDetail(order, context),
        child: Card(
          color:
              order.status == Status.unchecked ? Colors.red[200] : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              title: Row(
                children: [
                  Text(
                    order.number.toString(),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    order.name,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              trailing: Text(
                order.compName,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDetail(Order order, BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => detailDialog(order, context),
    );
  }

  Dialog detailDialog(Order order, BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            _header(order),
            _detail(order),
            _price(order),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _header(Order order) {
    return Row(
      children: [
        Text(order.number.toString()),
        Text(order.name),
        Column(
          children: [
            Text('14:00'),
            Text('オーダー${order.number}'),
          ],
        ),
        GFButton(
          color: Colors.grey,
          icon: Icon(
            Icons.phone,
            color: Colors.white,
          ),
          text: 'ヘルプ',
          onPressed: () => print,
        ),
      ],
    );
  }

  Widget _detail(Order order) {
    List<Widget> _list = order.menus
        .map(
          (menu) => Row(
            children: [
              Text(menu.name),
              Text(menu.price.toString()),
              Text(menu.quantity.toString()),
            ],
          ),
        )
        .toList();
    return Row(
      children: _list,
    );
  }

  Widget _price(Order order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            Text('小計'),
            Text('消費税'),
            Text('合計'),
          ],
        ),
        Column(
          children: [
            Text('1000'),
            Text('100'),
            Text('1100'),
          ],
        ),
      ],
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: GFButton(
        text: 'サンプルボタン',
        size: GFSize.LARGE,
        color: GFColors.DARK,
        blockButton: true,
        onPressed: () => print('tapped'),
      ),
    );
  }

  String strStatus(Status status) {
    switch (status) {
      case Status.unchecked:
        return '未確認';
      case Status.cooking:
        return '調理中';
      case Status.comleted:
        return '完了';
      case Status.canceled:
        return 'キャンセル';
    }
  }

  Widget _statusCard({required Status status}) {
    return Flexible(
      flex: 1,
      child: Card(
        color: status == Status.unchecked ? Colors.red[200] : Colors.white,
        child: ListTile(
          title: Center(
            child: Text(
              strStatus(status),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              _orderCard(
                order: order1,
                context: context,
              ),
              _statusCard(status: Status.cooking),
            ],
          ),
          Row(
            children: [
              _orderCard(
                order: order2,
                context: context,
              ),
              _statusCard(status: Status.unchecked),
            ],
          ),
        ],
      ),
    );
  }
}
