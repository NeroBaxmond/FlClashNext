import 'package:flclashx/common/common.dart';
import 'package:flclashx/enum/enum.dart';
import 'package:flutter/scheduler.dart';

class Render {

  factory Render() {
    _instance ??= Render._internal();
    return _instance!;
  }

  Render._internal();
  static Render? _instance;
  bool _isPaused = false;
  bool _isVisible = true;
  final _dispatcher = SchedulerBinding.instance.platformDispatcher;
  FrameCallback? _beginFrame;
  VoidCallback? _drawFrame;

  /// Track window visibility so pause() can be a no-op while the app sits in
  /// the tray (hidden). Must be set by the window layer.
  void setVisibility(bool visible) {
    _isVisible = visible;
    if (visible) {
      resume();
    }
  }

  void active() {
    resume();
    pause();
  }

  void pause() {
    // Never fully detach the frame handlers while the window is merely hidden
    // to tray: with onBeginFrame/onDrawFrame nulled, a hidden window stops
    // pumping frames entirely, and on Windows the engine then tears the app
    // down after a few seconds (the "app dies 3-4s after closing to tray"
    // bug). Minimize/restore still throttle via this path, but hidden-to-tray
    // windows keep a live frame pump.
    if (!_isVisible) return;
    throttler.call(
      FunctionTag.renderPause,
      _pause,
      duration: const Duration(seconds: 5),
    );
  }

  void resume() {
    throttler.cancel(FunctionTag.renderPause);
    _resume();
  }

  void _pause() async {
    if (_isPaused) return;
    _isPaused = true;
    _beginFrame = _dispatcher.onBeginFrame;
    _drawFrame = _dispatcher.onDrawFrame;
    _dispatcher.onBeginFrame = null;
    _dispatcher.onDrawFrame = null;
    commonPrint.log("pause");
  }

  void _resume() {
    if (!_isPaused) return;
    _isPaused = false;
    _dispatcher.onBeginFrame = _beginFrame;
    _dispatcher.onDrawFrame = _drawFrame;
    _dispatcher.scheduleFrame();
    commonPrint.log("resume");
  }
}

final Render? render = system.isDesktop ? Render() : null;
