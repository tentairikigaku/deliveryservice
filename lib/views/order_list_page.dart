import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OrderListPage extends HookWidget {
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
              Flexible(
                flex: 4,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            '001',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Text(
                            '吉田 太郎様',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Text(
                        'Uber Eats',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Center(
                      child: Text(
                        '調理中',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 4,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            '002',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Text(
                            '伊藤 絵里様',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Text(
                        '出前館',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Center(
                      child: Text(
                        '調理中',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
