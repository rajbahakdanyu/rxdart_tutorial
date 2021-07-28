import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rxdart/subjects.dart';

class ReaderBloc {
  final _dartStream = StreamController<String>();
  final _publishStream = PublishSubject<String>();
  final _behaviorStream = BehaviorSubject<String>();
  final _replayStream = ReplaySubject<String>(maxSize: 4);

  // Get
  Stream<String> get dartStream => _dartStream.stream.asBroadcastStream();
  Stream<String> get publishStream => _publishStream.stream;
  Stream<String> get behaviorStream => _behaviorStream.stream;
  Stream<String> get replayStream =>
      _replayStream.stream.map((l) => _replayStream.values.join("\n"));

  startReading() async {
    var contents = await rootBundle.loadString('assets/sonnet.txt');

    print(contents);
    _dartStream.add(contents);
    _publishStream.add(contents);
    _behaviorStream.add(contents);
    _replayStream.add(contents);
  }

  dispose() {
    _dartStream.close();
    _publishStream.close();
    _behaviorStream.close();
    _replayStream.close();
  }
}
