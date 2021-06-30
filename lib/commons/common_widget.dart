import 'package:delivery_system/views/models/order.dart';
import 'package:flutter/material.dart';

Widget wSpacer(double width) {
  return SizedBox(
    width: width,
  );
}

Widget hSpacer(double height) {
  return SizedBox(
    height: height,
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
