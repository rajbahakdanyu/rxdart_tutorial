import 'package:flutter/material.dart';

class Reader extends StatelessWidget {
  const Reader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sonnet 64'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Stream'),
              Tab(text: 'Publish'),
              Tab(text: 'Behaviour'),
              Tab(text: 'Replay'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Scaffold(
              body: Text('1'),
            ),
            Scaffold(
              body: Text('1'),
            ),
            Scaffold(
              body: Text('1'),
            ),
            Scaffold(
              body: Text('1'),
            ),
          ],
        ),
      ),
    );
  }
}
