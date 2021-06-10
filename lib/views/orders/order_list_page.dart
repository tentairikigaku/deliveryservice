import 'package:delivery_system/views/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OrderListPage extends HookWidget {
  Widget _orderCard(
      {required int number,
      required String name,
      required String compName,
      required Status status}) {
    return Flexible(
      flex: 4,
      child: Card(
        color: status == Status.unchecked ? Colors.red[200] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListTile(
            title: Row(
              children: [
                Text(
                  number.toString(),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            trailing: Text(
              compName,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _statusCard({required Status status}) {
    late final String strStatus;
    switch (status) {
      case Status.unchecked:
        strStatus = '未確認';
        break;
      case Status.cooking:
        strStatus = '調理中';
        break;
      case Status.comleted:
        strStatus = '完了';
        break;
      case Status.canceled:
        strStatus = 'キャンセル';
    }

    return Flexible(
      flex: 1,
      child: Card(
        color: status == Status.unchecked ? Colors.red[200] : Colors.white,
        child: ListTile(
          title: Center(
            child: Text(
              strStatus,
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
                number: 1,
                name: '吉田 拓磨様',
                compName: 'Uber Eats',
                status: Status.cooking,
              ),
              _statusCard(status: Status.cooking),
            ],
          ),
          Row(
            children: [
              _orderCard(
                number: 2,
                name: '伊藤 絵里様',
                compName: '出前館',
                status: Status.unchecked,
              ),
              _statusCard(status: Status.unchecked),
            ],
          ),
        ],
      ),
    );
  }
}
