import 'dart:async';
import 'dart:ui';

class Debouncer {
  Duration? duration;
  VoidCallback? action;
  Timer? timer;

  Debouncer({this.duration});
  void run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      duration ?? const Duration(seconds: 1),
      action,
    );
  }
}
