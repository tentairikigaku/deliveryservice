import 'package:flutter/material.dart';

class OrderListPage extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => OrderListPage());
  }

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('新規注文'),
      ),
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Colors.grey,
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
          )
        ],
      ),
    );
    ;
  }
}
