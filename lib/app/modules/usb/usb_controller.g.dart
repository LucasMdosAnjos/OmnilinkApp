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
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$portsAtom = Atom(name: '_UsbControllerBase.ports');

  @override
  ObservableList<Widget> get ports {
    _$portsAtom.context.enforceReadPolicy(_$portsAtom);
    _$portsAtom.reportObserved();
    return super.ports;
  }

  @override
  set ports(ObservableList<Widget> value) {
    _$portsAtom.context.conditionallyRunInAction(() {
      super.ports = value;
      _$portsAtom.reportChanged();
    }, _$portsAtom, name: '${_$portsAtom.name}_set');
  }

  final _$serialDataAtom = Atom(name: '_UsbControllerBase.serialData');

  @override
  ObservableList<String> get serialData {
    _$serialDataAtom.context.enforceReadPolicy(_$serialDataAtom);
    _$serialDataAtom.reportObserved();
    return super.serialData;
  }

  @override
  set serialData(ObservableList<String> value) {
    _$serialDataAtom.context.conditionallyRunInAction(() {
      super.serialData = value;
      _$serialDataAtom.reportChanged();
    }, _$serialDataAtom, name: '${_$serialDataAtom.name}_set');
  }

  final _$deviceIdAtom = Atom(name: '_UsbControllerBase.deviceId');

  @override
  int get deviceId {
    _$deviceIdAtom.context.enforceReadPolicy(_$deviceIdAtom);
    _$deviceIdAtom.reportObserved();
    return super.deviceId;
  }

  @override
  set deviceId(int value) {
    _$deviceIdAtom.context.conditionallyRunInAction(() {
      super.deviceId = value;
      _$deviceIdAtom.reportChanged();
    }, _$deviceIdAtom, name: '${_$deviceIdAtom.name}_set');
  }

  final _$widgetsAtom = Atom(name: '_UsbControllerBase.widgets');

  @override
  ObservableList<Widget> get widgets {
    _$widgetsAtom.context.enforceReadPolicy(_$widgetsAtom);
    _$widgetsAtom.reportObserved();
    return super.widgets;
  }

  @override
  set widgets(ObservableList<Widget> value) {
    _$widgetsAtom.context.conditionallyRunInAction(() {
      super.widgets = value;
      _$widgetsAtom.reportChanged();
    }, _$widgetsAtom, name: '${_$widgetsAtom.name}_set');
  }

  final _$showClockAtom = Atom(name: '_UsbControllerBase.showClock');

  @override
  bool get showClock {
    _$showClockAtom.context.enforceReadPolicy(_$showClockAtom);
    _$showClockAtom.reportObserved();
    return super.showClock;
  }

  @override
  set showClock(bool value) {
    _$showClockAtom.context.conditionallyRunInAction(() {
      super.showClock = value;
      _$showClockAtom.reportChanged();
    }, _$showClockAtom, name: '${_$showClockAtom.name}_set');
  }

  final _$selectedOptionAtom = Atom(name: '_UsbControllerBase.selectedOption');

  @override
  int get selectedOption {
    _$selectedOptionAtom.context.enforceReadPolicy(_$selectedOptionAtom);
    _$selectedOptionAtom.reportObserved();
    return super.selectedOption;
  }

  @override
  set selectedOption(int value) {
    _$selectedOptionAtom.context.conditionallyRunInAction(() {
      super.selectedOption = value;
      _$selectedOptionAtom.reportChanged();
    }, _$selectedOptionAtom, name: '${_$selectedOptionAtom.name}_set');
  }

  final _$expandPanelOptionsAtom =
      Atom(name: '_UsbControllerBase.expandPanelOptions');

  @override
  bool get expandPanelOptions {
    _$expandPanelOptionsAtom.context
        .enforceReadPolicy(_$expandPanelOptionsAtom);
    _$expandPanelOptionsAtom.reportObserved();
    return super.expandPanelOptions;
  }

  @override
  set expandPanelOptions(bool value) {
    _$expandPanelOptionsAtom.context.conditionallyRunInAction(() {
      super.expandPanelOptions = value;
      _$expandPanelOptionsAtom.reportChanged();
    }, _$expandPanelOptionsAtom, name: '${_$expandPanelOptionsAtom.name}_set');
  }

  final _$setPortConfigsAsyncAction = AsyncAction('setPortConfigs');

  @override
  Future<dynamic> setPortConfigs() {
    return _$setPortConfigsAsyncAction.run(() => super.setPortConfigs());
  }

  final _$_UsbControllerBaseActionController =
      ActionController(name: '_UsbControllerBase');

  @override
  void setClock(bool value) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.setClock(value);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPanelExpand() {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.setPanelExpand();
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOption(int option) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.setOption(option);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSegmentedOption(int option) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.changeSegmentedOption(option);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSerial(String text) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.addSerial(text);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSerialData() {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.clearSerialData();
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nullDeviceId() {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.nullDeviceId();
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStatus(String msg) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.changeStatus(msg);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDeviceId(dynamic device) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.setDeviceId(device);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void listenSerial() {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.listenSerial();
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPort() {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.addPort();
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void buildWidgetPorts(List<UsbDevice> devices) {
    final _$actionInfo = _$_UsbControllerBaseActionController.startAction();
    try {
      return super.buildWidgetPorts(devices);
    } finally {
      _$_UsbControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'status: ${status.toString()},ports: ${ports.toString()},serialData: ${serialData.toString()},deviceId: ${deviceId.toString()},widgets: ${widgets.toString()},showClock: ${showClock.toString()},selectedOption: ${selectedOption.toString()},expandPanelOptions: ${expandPanelOptions.toString()}';
    return '{$string}';
  }
}
