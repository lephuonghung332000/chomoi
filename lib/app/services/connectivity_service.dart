import 'dart:async';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/util/get_cupertino_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ConnectivityService {
  static ConnectivityService get get => Get.find<ConnectivityService>();
  ConnectivityResult get connectivityStatus;
  void start();
  void stop();
  void showNoInternetDialog();
  Worker addConnectivityStatusListener(
      ValueChanged<ConnectivityResult> listener);
}

class ConnectivityServiceImpl extends GetxService
    implements ConnectivityService {
  @override
  ConnectivityResult get connectivityStatus => _connectivityResult.value;

  bool _isShowingDialog = false;

  final Rx<ConnectivityResult> _connectivityResult =
      Rx<ConnectivityResult>(ConnectivityResult.none);

  StreamSubscription<ConnectivityResult>? _listener;

  @override
  void start() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      showNoInternetDialog();
    }

    _listener ??= Connectivity().onConnectivityChanged.listen((event) {
      _connectivityResult.value = event;
      if (event == ConnectivityResult.none) {
        showNoInternetDialog();
      } else if (_isShowingDialog) {
        _isShowingDialog = false;
        Get.back();
      }
    });
  }

  @override
  void stop() {
    _listener?.cancel();
    _listener = null;
  }

  @override
  void onClose() {
    stop();
    super.onClose();
  }

  @override
  void showNoInternetDialog() async {
    if (_isShowingDialog) {
      return;
    }
    _isShowingDialog = true;
    await Get.cupertinoDialog(
        title: AppStrings.dialog_turnOn_network_description.tr,
        textConfirm: AppStrings.button_ok,
        onConfirm: () => Get.back(),
        barrierDismissible: false);
    _isShowingDialog = false;
  }

  @override
  Worker addConnectivityStatusListener(
      ValueChanged<ConnectivityResult> listener) {
    return ever<ConnectivityResult>(_connectivityResult, listener);
  }
}
