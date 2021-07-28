import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rxdart_tutorial/blocs/reader_bloc.dart';

class Reader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var readerBloc = Provider.of<ReaderBloc>(context);
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
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TabBarView(
            children: [
              Scaffold(
                body: tabBody(
                    readerBloc.dartStream, 'Standard Dart Stream Controller.'),
              ),
              Scaffold(
                body: tabBody(readerBloc.publishStream,
                    'Exactly like a normal broadcast StreamController with one exception: this class is both a Stream and Sink.'),
              ),
              Scaffold(
                body: tabBody(readerBloc.behaviorStream,
                    'A special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener.'),
              ),
              Scaffold(
                body: tabBody(readerBloc.replayStream,
                    'A special StreamController that captures all of the items that have been added to the controller, and emits those as the first items to any new listener.'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  tabBody(Stream<String> stream, String desc) {
    return ListView(
      children: [
        Text(desc),
        SizedBox(height: 20.0),
        Divider(),
        StreamBuilder<String>(
            stream: stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text('Loading');
              return Text(
                snapshot.data!,
                style: GoogleFonts.imFellEnglish(
                  textStyle: TextStyle(fontSize: 22.0),
                ),
              );
            }),
      ],
    );
  }
}
