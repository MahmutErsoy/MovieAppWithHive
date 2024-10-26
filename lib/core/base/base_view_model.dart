import 'dart:async';
import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool _isDisposed = false;
  final bool _isInitializeDone = false;
  BuildContext? context;

  FutureOr<void> _initState;

  FutureOr<void> init();

  void setContext(BuildContext context);

  void changeStatus() => isLoading = !isLoading;

  void reloadState() {
    if (!isLoading) notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    changeStatus();
    _isDisposed = true;
  }

  //Getters
  FutureOr<void> get initState => _initState;

  bool get isLoading => _isLoading;
  bool get isDisposed => _isDisposed;
  bool get isInitialized => _isInitializeDone;

  //Setters
  set isLoading(bool value) {
    _isLoading = value;
    scheduleMicrotask(() {
      if (!_isDisposed) notifyListeners();
    });
  }
}