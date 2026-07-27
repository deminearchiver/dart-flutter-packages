import 'package:flutter/scheduler.dart';

class FrameCallbackScheduler {
  FrameCallbackScheduler(
    void Function(Duration timestamp) callback, {
    SchedulerBinding? schedulerBinding,
  }) : _callback = callback,
       _scheduler = schedulerBinding ?? SchedulerBinding.instance;

  // Not using `FrameCallback` to enforce "timestamp" instead of "timeStamp".
  final void Function(Duration timestamp) _callback;

  final SchedulerBinding _scheduler;

  bool _isScheduled = false;

  int? _lastCallbackId;

  bool _isExecutingCallback = false;

  void _frameCallback(Duration timestamp) {
    _isScheduled = false;
    _lastCallbackId = null;
    _isExecutingCallback = true;
    try {
      _callback(timestamp);
    } finally {
      _isExecutingCallback = false;
    }
  }

  bool schedule({bool canSkip = false}) {
    if (_isScheduled) {
      if (canSkip) return false;
      cancel();
    }
    _isScheduled = true;
    _lastCallbackId = _scheduler.scheduleFrameCallback(
      _frameCallback,
      scheduleNewFrame: false,
      rescheduling: _isExecutingCallback,
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
