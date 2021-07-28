import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rxdart_tutorial/blocs/reader_bloc.dart';
import 'package:rxdart_tutorial/screens/launch.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ReaderBloc(),
      child: MaterialApp(
        title: 'RxDart Tutorial',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Launch(),
      ),
    );
  }
}
