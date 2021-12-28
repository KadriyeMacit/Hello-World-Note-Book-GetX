import 'dart:async';
import 'package:get/get.dart' as GetX;

extension RxTestObserverExtensions<T> on GetX.Rx<T> {
  TestObserver<T> get testObserver => TestObserver(stream);
}

extension RxnTestObserverExtensions<T> on GetX.Rxn<T> {
  TestObserver<T?> get testObserver => TestObserver(stream);
}

extension RxListTestObserverExtensions<T> on GetX.RxList<T> {
  TestObserver<List<T>> get testObserver => TestObserver(stream);
}

class TestObserver<T> {
  final Stream<T> _stream;
  final List<T> _history = [];
  late final StreamSubscription<T> subscription;

  TestObserver(this._stream) {
    subscription = _stream.listen(_history.add);
  }

  List<T> get history {
    subscription.cancel();
    return _history;
  }
}
