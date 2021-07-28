import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rxdart_tutorial/blocs/reader_bloc.dart';
import 'package:rxdart_tutorial/screens/reader.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  late ReaderBloc readerBloc;

  @override
  void dispose() {
    readerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    readerBloc = Provider.of<ReaderBloc>(context);

    return Scaffold(
      body: Center(
        child: Container(
          height: 300.0,
          child: Column(
            children: [
              Text(
                'Shakespeare\'s Sonnets',
                style: TextStyle(fontSize: 26.0),
              ),
              Text(
                'Sonnet 64',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 80.0),
              ElevatedButton(
                onPressed: () {
                  // Launch Reader
                  readerBloc.startReading();

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Reader()),
                  );
                },
                child: Text(
                  'Engage',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
