import 'dart:async';

import 'package:rxdart/subjects.dart';

class ReaderBloc {
  final _dartStream = StreamController<String>();
  final _publishStream = PublishSubject<String>();
  final _behaviourStream = BehaviorSubject<String>();
  final _replayStream = ReplaySubject<String>();

  dispose() {
    _dartStream.close();
    _publishStream.close();
    _behaviourStream.close();
    _replayStream.close();
  }
}
