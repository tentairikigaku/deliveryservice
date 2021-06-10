// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:delivery_system/views/orders/order_list_page.dart';

class HomePage extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    Text(
      'Index 1',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    OrderListPage(),
    Text(
      'Index 3',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    Text(
      'Index 4',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ];

  final List<String> _titles = [
    'サンプル1',
    'サンプル2',
    '新規注文',
    'サンプル3',
    'サンプル4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      body: Row(
        children: [
          NavigationRail(
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.list),
                label: Text(''),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.book),
                label: Text(''),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.web_asset_outlined),
                label: Text(''),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.assistant_photo),
                label: Text(''),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.access_time),
                label: Text(''),
              ),
            ],
            selectedIndex: _selectedIndex,
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
            color: Colors.black,
          ),
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
    );
    ;
  }
}
