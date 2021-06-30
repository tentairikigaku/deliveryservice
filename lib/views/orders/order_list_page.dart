// Flutter imports:
import 'package:delivery_system/commons/common_widget.dart';
import 'package:delivery_system/commons/theme.dart';
import 'package:delivery_system/views/models/menu.dart';
// Project imports:
import 'package:delivery_system/views/models/order.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final expandedProvider = StateProvider(
  (ref) => [
    false,
    false,
    true,
    false,
  ],
);

class OrderListPage extends HookWidget {
  final order1 = Order(
    1,
    '吉田 拓磨様',
    'Uber Eats',
    [Menu('ハンバーガー', 1, 200)],
    Status.cooking,
    200,
    20,
    DateTime(2021, 6, 19, 12, 10),
  );

  final order2 = Order(
    2,
    '伊藤 絵里様',
    '出前館',
    [Menu('チーズバーガー', 2, 200), Menu('コーラ', 1, 100)],
    Status.unchecked,
    500,
    50,
    DateTime(2021, 6, 19, 13, 00),
  );

  final order3 = Order(
    3,
    '佐藤 太郎様',
    '出前館',
    [Menu('チーズバーガー', 2, 200), Menu('コーラ', 1, 100)],
    Status.unchecked,
    500,
    50,
    DateTime(2021, 6, 19, 13, 11),
  );

  Dialog acpOrRjcDialog(Order order, BuildContext context, String ar) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 100,
        width: 200,
        child: Center(
          child:
              ar == 'Accepted' ? const Text('受注しました') : const Text('キャンセルしました'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var boolList = useProvider(expandedProvider).state;
    print(boolList);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNotification(context),
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.notification_add_outlined,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.access_time),
                wSpacer(20),
                const Text(
                  'うまもんや Umamonya',
                  style: exLargeText,
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                const Text(
                  '2021年8月30日',
                  style: exLargeText,
                ),
                IconButton(
                  onPressed: () => print(true),
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                  ),
                )
              ],
            ),
            _orderCard(
              order: order1,
              context: context,
            ),
            _orderCard(
              order: order2,
              context: context,
            ),
            _orderCard(
              order: order3,
              context: context,
            ),
            _hoge(
              order: order3,
              context: context,
              boolList: boolList,
            )
          ],
        ),
      ),
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
            Expanded(
              child: Column(
                children: [
                  _header(order, context),
                  Divider(
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Expanded(
                    child: _detail(order),
                  ),
                  _price(order),
                ],
              ),
            ),
            hSpacer(50),
            _buttonAccepted(order, context),
            _buttonRejected(order, context),
            hSpacer(50),
          ],
        ),
      ),
    );
  }

  Dialog helpDialog(Order order, BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 100,
        width: 200,
        child: Center(
          child: order == order1
              ? const Text('03-9876-5432')
              : const Text('03-1234-5678'),
        ),
      ),
    );
  }

  Dialog newOrderDialog(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.amber.withOpacity(0.3),
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.8),
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: 70,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              hSpacer(20),
              const Text(
                '新規注文が入りました！',
                style: exLargeText,
              ),
              const Text(
                '画面をタップして受付をしてください',
                style: exLargeText,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget setDS(String str) {
    final bgColorCode = (() {
      switch (str) {
        case 'Uber Eats':
          return HexColor('#e83435');
        case '出前館':
          return HexColor('#00c167');
        default:
          return HexColor('#000000');
      }
    })();
    return Container(
      padding: const EdgeInsets.all(5),
      width: 100,
      decoration: BoxDecoration(
        color: bgColorCode,
        border: Border.all(color: bgColorCode),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: Text(
          str,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: HexColor('FFFFFF'),
          ),
        ),
      ),
    );
  }

  Widget _buttonAccepted(Order order, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: GFButton(
          text: '受注',
          size: GFSize.LARGE,
          color: GFColors.DARK,
          blockButton: true,
          onPressed: () async =>
              _showChOrderFirstStatus(order, context, 'Accepted')),
    );
  }

  Widget _buttonRejected(Order order, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: GFButton(
          text: 'キャンセル',
          size: GFSize.LARGE,
          color: GFColors.DARK,
          blockButton: true,
          onPressed: () async =>
              _showChOrderFirstStatus(order, context, 'Rejected')),
    );
  }

  Widget _detail(Order order) {
    final List<Widget> _list = order.menus
        .map(
          (menu) => SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    wSpacer(50),
                    Text(
                      menu.quantity.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    wSpacer(50),
                    Text(
                      menu.name,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      (menu.price * menu.quantity).toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    wSpacer(50),
                  ],
                )
              ],
            ),
          ),
        )
        .toList();
    return Column(
      children: _list,
    );
  }

  Widget _header(Order order, BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              wSpacer(50),
              Text(
                order.compName.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              wSpacer(50),
              Text(
                order.number.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              wSpacer(50),
              Text(
                order.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('14:00'),
                  Text('オーダー${order.number}'),
                ],
              ),
              wSpacer(50),
              GFButton(
                color: Colors.grey,
                icon: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                text: 'ヘルプ',
                onPressed: () async => _showHelpInfo(order, context),
              ),
              wSpacer(50),
            ],
          ),
        ],
      ),
    );
  }

  Widget _hoge({
    required Order order,
    required BuildContext context,
    required List<bool> boolList,
  }) {
    return ExpansionPanelList(
      expansionCallback: (index, isOpen) {
        print(index);
        print(isOpen);
        boolList[index] = !isOpen;
        context.read(expandedProvider).state = boolList;
        // context.read(expandedProvider.notifier).state =
      },
      children: [
        ExpansionPanel(
          headerBuilder: (context, isOpen) {
            return ListTile(
              title: Text('hoe'),
              trailing: SizedBox.shrink(),
            );
          },
          body: Text('aaaaaaa'),
          isExpanded: boolList[0],
          canTapOnHeader: true,
        ),
      ],
    );
  }

  Widget _orderCard({
    required Order order,
    required BuildContext context,
  }) {
    return Flexible(
      flex: 4,
      child: InkWell(
        onTap: () async => _showDetail(order, context),
        child: Card(
          color: (() {
            if (order.status == Status.unchecked) {
              return Colors.red[200];
            } else if (order.status == Status.canceled) {
              return Colors.grey;
            } else {
              return Colors.white;
            }
          })(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              title: Row(
                children: [
                  setDS(order.compName),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    '注文番号 ${order.number}',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    order.name,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '合計金額　${order.subtotal}',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
//                  Text(
                  //                    "14:00"
//                  order.arrivalTime.hour.toString()+":"+order.arrivalTime.minute.toString()
                  //              )
                ],
              ),
              trailing: const Icon(Icons.arrow_drop_down_circle),
            ),
          ),
        ),
      ),
    );
  }

  Widget _price(Order order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: const [
            Text('小計'),
            Text('消費税'),
            Text('合計'),
          ],
        ),
        wSpacer(30),
        Column(
          children: [
            Text(order.subtotal.toString()),
            Text(order.tax.toString()),
            Text((order.subtotal + order.tax).toString()),
          ],
        ),
        wSpacer(50),
      ],
    );
  }

  Future<void> _showChOrderFirstStatus(
      Order order, BuildContext context, String ar) async {
    return showDialog(
      context: context,
      builder: (_) => acpOrRjcDialog(order, context, ar),
    );
  }

  Future<void> _showDetail(Order order, BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => detailDialog(order, context),
    );
  }

  Future<void> _showHelpInfo(Order order, BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => helpDialog(order, context),
    );
  }

  Future<void> _showNotification(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: newOrderDialog(context),
      ),
    );
  }

  Widget _statusCard({required Status status}) {
    return Flexible(
      flex: 1,
      child: Card(
        color: (() {
          if (status == Status.unchecked) {
            return Colors.red[200];
          } else if (status == Status.canceled) {
            return Colors.grey;
          } else {
            return Colors.white;
          }
        })(),
//        color: status == Status.unchecked ? Colors.red[200] : Colors.white,
        child: ListTile(
          title: Center(
            child: Text(
              strStatus(status),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
