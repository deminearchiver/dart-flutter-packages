import 'package:flutter/scheduler.dart';

class FrameCallbackScheduler {
  FrameCallbackScheduler(this.callback)
    : _scheduler = SchedulerBinding.instance;

  final void Function(Duration timestamp) callback;

  final SchedulerBinding _scheduler;

  bool _isScheduled = false;

  int? _lastCallbackId;

  void _callback(Duration timestamp) {
    _isScheduled = false;
    _lastCallbackId = null;
    callback(timestamp);
  }

  bool schedule({bool canSkip = false}) {
    if (_isScheduled) {
      if (canSkip) return false;
      cancel();
    }
    _isScheduled = true;
    _lastCallbackId = _scheduler.scheduleFrameCallback(
      _callback,
      scheduleNewFrame: false,
      rescheduling:
          _scheduler.schedulerPhase == .transientCallbacks &&
          _lastCallbackId == null,
    );
    return true;
  }

  bool cancel() {
    if (_lastCallbackId case final lastCallbackId?) {
      _scheduler.cancelFrameCallbackWithId(lastCallbackId);
      _isScheduled = false;
      _lastCallbackId = null;
      return true;
    }
    return false;
  }
}
