// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BluetoothController on _BluetoothControllerBase, Store {
  final _$resultsAtom = Atom(name: '_BluetoothControllerBase.results');

  @override
  List<ScanResult> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(List<ScanResult> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$rAtom = Atom(name: '_BluetoothControllerBase.r');

  @override
  ScanResult get r {
    _$rAtom.reportRead();
    return super.r;
  }

  @override
  set r(ScanResult value) {
    _$rAtom.reportWrite(value, super.r, () {
      super.r = value;
    });
  }

  final _$contextAtom = Atom(name: '_BluetoothControllerBase.context');

  @override
  BuildContext get context {
    _$contextAtom.reportRead();
    return super.context;
  }

  @override
  set context(BuildContext value) {
    _$contextAtom.reportWrite(value, super.context, () {
      super.context = value;
    });
  }

  final _$writeCharacAtom = Atom(name: '_BluetoothControllerBase.writeCharac');

  @override
  BluetoothCharacteristic get writeCharac {
    _$writeCharacAtom.reportRead();
    return super.writeCharac;
  }

  @override
  set writeCharac(BluetoothCharacteristic value) {
    _$writeCharacAtom.reportWrite(value, super.writeCharac, () {
      super.writeCharac = value;
    });
  }

  final _$ultimaRequisicaoAtom =
      Atom(name: '_BluetoothControllerBase.ultimaRequisicao');

  @override
  String get ultimaRequisicao {
    _$ultimaRequisicaoAtom.reportRead();
    return super.ultimaRequisicao;
  }

  @override
  set ultimaRequisicao(String value) {
    _$ultimaRequisicaoAtom.reportWrite(value, super.ultimaRequisicao, () {
      super.ultimaRequisicao = value;
    });
  }

  final _$valueAtom = Atom(name: '_BluetoothControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$devicesAtom = Atom(name: '_BluetoothControllerBase.devices');

  @override
  ObservableList<Widget> get devices {
    _$devicesAtom.reportRead();
    return super.devices;
  }

  @override
  set devices(ObservableList<Widget> value) {
    _$devicesAtom.reportWrite(value, super.devices, () {
      super.devices = value;
    });
  }

  final _$connectedDeviceAtom =
      Atom(name: '_BluetoothControllerBase.connectedDevice');

  @override
  String get connectedDevice {
    _$connectedDeviceAtom.reportRead();
    return super.connectedDevice;
  }

  @override
  set connectedDevice(String value) {
    _$connectedDeviceAtom.reportWrite(value, super.connectedDevice, () {
      super.connectedDevice = value;
    });
  }

  final _$resultDeviceAtom =
      Atom(name: '_BluetoothControllerBase.resultDevice');

  @override
  ScanResult get resultDevice {
    _$resultDeviceAtom.reportRead();
    return super.resultDevice;
  }

  @override
  set resultDevice(ScanResult value) {
    _$resultDeviceAtom.reportWrite(value, super.resultDevice, () {
      super.resultDevice = value;
    });
  }

  final _$showLoadingAtom = Atom(name: '_BluetoothControllerBase.showLoading');

  @override
  bool get showLoading {
    _$showLoadingAtom.reportRead();
    return super.showLoading;
  }

  @override
  set showLoading(bool value) {
    _$showLoadingAtom.reportWrite(value, super.showLoading, () {
      super.showLoading = value;
    });
  }

  final _$selectedOptionAtom =
      Atom(name: '_BluetoothControllerBase.selectedOption');

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

  final _$widgetsAtom = Atom(name: '_BluetoothControllerBase.widgets');

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

  final _$serialDataAtom = Atom(name: '_BluetoothControllerBase.serialData');

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

  final _$expandPanelOptionsAtom =
      Atom(name: '_BluetoothControllerBase.expandPanelOptions');

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

  final _$disconnectDeviceAsyncAction =
      AsyncAction('_BluetoothControllerBase.disconnectDevice');

  @override
  Future<void> disconnectDevice() {
    return _$disconnectDeviceAsyncAction.run(() => super.disconnectDevice());
  }

  final _$updateWidgetsAsyncAction =
      AsyncAction('_BluetoothControllerBase.updateWidgets');

  @override
  Future<void> updateWidgets() {
    return _$updateWidgetsAsyncAction.run(() => super.updateWidgets());
  }

  final _$_BluetoothControllerBaseActionController =
      ActionController(name: '_BluetoothControllerBase');

  @override
  void setContext(BuildContext ctx) {
    final _$actionInfo = _$_BluetoothControllerBaseActionController.startAction(
        name: '_BluetoothControllerBase.setContext');
    try {
      return super.setContext(ctx);
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void scanDevices() {
    final _$actionInfo = _$_BluetoothControllerBaseActionController.startAction(
        name: '_BluetoothControllerBase.scanDevices');
    try {
      return super.scanDevices();
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addWidgetsDevices(List<ScanResult> results) {
    final _$actionInfo = _$_BluetoothControllerBaseActionController.startAction(
        name: '_BluetoothControllerBase.addWidgetsDevices');
    try {
      return super.addWidgetsDevices(results);
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_BluetoothControllerBaseActionController.startAction(
        name: '_BluetoothControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOption(int option) {
    final _$actionInfo = _$_BluetoothControllerBaseActionController.startAction(
        name: '_BluetoothControllerBase.setOption');
    try {
      return super.setOption(option);
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSegmentedOption(int option) {
    final _$actionInfo = _$_BluetoothControllerBaseActionController.startAction(
        name: '_BluetoothControllerBase.changeSegmentedOption');
    try {
      return super.changeSegmentedOption(option);
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
results: ${results},
r: ${r},
context: ${context},
writeCharac: ${writeCharac},
ultimaRequisicao: ${ultimaRequisicao},
value: ${value},
devices: ${devices},
connectedDevice: ${connectedDevice},
resultDevice: ${resultDevice},
showLoading: ${showLoading},
selectedOption: ${selectedOption},
widgets: ${widgets},
serialData: ${serialData},
expandPanelOptions: ${expandPanelOptions}
    ''';
  }
}
