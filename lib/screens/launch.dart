import 'package:flutter/material.dart';
import 'package:rxdart_tutorial/screens/reader.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Reader()),
                  )
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
