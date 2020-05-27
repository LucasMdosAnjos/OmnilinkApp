// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usb_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsbController on _UsbControllerBase, Store {
  final _$statusAtom = Atom(name: '_UsbControllerBase.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$portsAtom = Atom(name: '_UsbControllerBase.ports');

  @override
  ObservableList<Widget> get ports {
    _$portsAtom.reportRead();
    return super.ports;
  }

  @override
  set ports(ObservableList<Widget> value) {
    _$portsAtom.reportWrite(value, super.ports, () {
      super.ports = value;
    });
  }

  final _$serialDataAtom = Atom(name: '_UsbControllerBase.serialData');

  @override
  ObservableList<String> get serialData {
    _$serialDataAtom.reportRead();
    return super.serialData;
  }

  @override
  set serialData(ObservableList<String> value) {
    _$serialDataAtom.reportWrite(value, super.serialData, () {
      super.serialData = value;
    });
  }

  final _$deviceIdAtom = Atom(name: '_UsbControllerBase.deviceId');

  @override
  int get deviceId {
    _$deviceIdAtom.reportRead();
    return super.deviceId;
  }

  @override
  set deviceId(int value) {
    _$deviceIdAtom.reportWrite(value, super.deviceId, () {
      super.deviceId = value;
    });
  }

  final _$widgetsAtom = Atom(name: '_UsbControllerBase.widgets');

  @override
  ObservableList<Widget> get widgets {
    _$widgetsAtom.reportRead();
    return super.widgets;
  }

  @override
  set widgets(ObservableList<Widget> value) {
    _$widgetsAtom.reportWrite(value, super.widgets, () {
      super.widgets = value;
    });
  }

  final _$showClockAtom = Atom(name: '_UsbControllerBase.showClock');

  @override
  bool get showClock {
    _$showClockAtom.reportRead();
    return super.showClock;
  }

  @override
  set showClock(bool value) {
    _$showClockAtom.reportWrite(value, super.showClock, () {
      super.showClock = value;
    });
  }

  final _$selectedOptionAtom = Atom(name: '_UsbControllerBase.selectedOption');

  @override
  int get selectedOption {
    _$selectedOptionAtom.reportRead();
    return super.selectedOption;
  }

  @override
  set selectedOption(int value) {
    _$selectedOptionAtom.reportWrite(value, super.selectedOption, () {
      super.selectedOption = value;
    });
  }

  final _$expandPanelOptionsAtom =
      Atom(name: '_UsbControllerBase.expandPanelOptions');

  @override
  bool get expandPanelOptions {
    _$expandPanelOptionsAtom.reportRead();
    return super.expandPanelOptions;
  }

  @override
  set expandPanelOptions(bool value) {
    _$expandPanelOptionsAtom.reportWrite(value, super.expandPanelOptions, () {
      super.expandPanelOptions = value;
    });
  }

  final _$setPortConfigsAsyncAction =
      AsyncAction('_UsbControllerBase.setPortConfigs');

  @override
  Future<dynamic> setPortConfigs() {
    return _$setPortConfigsAsyncAction.run(() => super.setPortConfigs());
  }

  final _$_UsbControllerBaseActionController =
      ActionController(name: '_UsbControllerBase');

  @override
  void setClock(bool value) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.setClock');
    try {
      return super.setClock(value);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPanelExpand() {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.setPanelExpand');
    try {
      return super.setPanelExpand();
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOption(int option) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.setOption');
    try {
      return super.setOption(option);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSegmentedOption(int option) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.changeSegmentedOption');
    try {
      return super.changeSegmentedOption(option);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSerial(String text) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.addSerial');
    try {
      return super.addSerial(text);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSerialData() {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.clearSerialData');
    try {
      return super.clearSerialData();
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nullDeviceId() {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.nullDeviceId');
    try {
      return super.nullDeviceId();
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStatus(String msg) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.changeStatus');
    try {
      return super.changeStatus(msg);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeviceId(dynamic device) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.setDeviceId');
    try {
      return super.setDeviceId(device);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void listenSerial() {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.listenSerial');
    try {
      return super.listenSerial();
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPort() {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.addPort');
    try {
      return super.addPort();
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void buildWidgetPorts(List<UsbDevice> devices) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction(
        name: '_UsbControllerBase.buildWidgetPorts');
    try {
      return super.buildWidgetPorts(devices);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
ports: ${ports},
serialData: ${serialData},
deviceId: ${deviceId},
widgets: ${widgets},
showClock: ${showClock},
selectedOption: ${selectedOption},
expandPanelOptions: ${expandPanelOptions}
    ''';
  }
}
