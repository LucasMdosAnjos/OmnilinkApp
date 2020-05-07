// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BluetoothController on _BluetoothControllerBase, Store {
  final _$valueAtom = Atom(name: '_BluetoothControllerBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$devicesAtom = Atom(name: '_BluetoothControllerBase.devices');

  @override
  ObservableList<Widget> get devices {
    _$devicesAtom.context.enforceReadPolicy(_$devicesAtom);
    _$devicesAtom.reportObserved();
    return super.devices;
  }

  @override
  set devices(ObservableList<Widget> value) {
    _$devicesAtom.context.conditionallyRunInAction(() {
      super.devices = value;
      _$devicesAtom.reportChanged();
    }, _$devicesAtom, name: '${_$devicesAtom.name}_set');
  }

  final _$connectedDeviceAtom =
      Atom(name: '_BluetoothControllerBase.connectedDevice');

  @override
  String get connectedDevice {
    _$connectedDeviceAtom.context.enforceReadPolicy(_$connectedDeviceAtom);
    _$connectedDeviceAtom.reportObserved();
    return super.connectedDevice;
  }

  @override
  set connectedDevice(String value) {
    _$connectedDeviceAtom.context.conditionallyRunInAction(() {
      super.connectedDevice = value;
      _$connectedDeviceAtom.reportChanged();
    }, _$connectedDeviceAtom, name: '${_$connectedDeviceAtom.name}_set');
  }

  final _$resultDeviceAtom =
      Atom(name: '_BluetoothControllerBase.resultDevice');

  @override
  ScanResult get resultDevice {
    _$resultDeviceAtom.context.enforceReadPolicy(_$resultDeviceAtom);
    _$resultDeviceAtom.reportObserved();
    return super.resultDevice;
  }

  @override
  set resultDevice(ScanResult value) {
    _$resultDeviceAtom.context.conditionallyRunInAction(() {
      super.resultDevice = value;
      _$resultDeviceAtom.reportChanged();
    }, _$resultDeviceAtom, name: '${_$resultDeviceAtom.name}_set');
  }

  final _$showLoadingAtom = Atom(name: '_BluetoothControllerBase.showLoading');

  @override
  bool get showLoading {
    _$showLoadingAtom.context.enforceReadPolicy(_$showLoadingAtom);
    _$showLoadingAtom.reportObserved();
    return super.showLoading;
  }

  @override
  set showLoading(bool value) {
    _$showLoadingAtom.context.conditionallyRunInAction(() {
      super.showLoading = value;
      _$showLoadingAtom.reportChanged();
    }, _$showLoadingAtom, name: '${_$showLoadingAtom.name}_set');
  }

  final _$selectedOptionAtom =
      Atom(name: '_BluetoothControllerBase.selectedOption');

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

  final _$widgetsAtom = Atom(name: '_BluetoothControllerBase.widgets');

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

  final _$serialDataAtom = Atom(name: '_BluetoothControllerBase.serialData');

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

  final _$expandPanelOptionsAtom =
      Atom(name: '_BluetoothControllerBase.expandPanelOptions');

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

  final _$disposeAsyncAction = AsyncAction('dispose');

  @override
  Future<void> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  final _$_BluetoothControllerBaseActionController =
      ActionController(name: '_BluetoothControllerBase');

  @override
  void addWidgetsDevices(List<ScanResult> results) {
    final _$actionInfo =
        _$_BluetoothControllerBaseActionController.startAction();
    try {
      return super.addWidgetsDevices(results);
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo =
        _$_BluetoothControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPanelExpand() {
    final _$actionInfo =
        _$_BluetoothControllerBaseActionController.startAction();
    try {
      return super.setPanelExpand();
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOption(int option) {
    final _$actionInfo =
        _$_BluetoothControllerBaseActionController.startAction();
    try {
      return super.setOption(option);
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateWidgets() {
    final _$actionInfo =
        _$_BluetoothControllerBaseActionController.startAction();
    try {
      return super.updateWidgets();
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSegmentedOption(int option) {
    final _$actionInfo =
        _$_BluetoothControllerBaseActionController.startAction();
    try {
      return super.changeSegmentedOption(option);
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'value: ${value.toString()},devices: ${devices.toString()},connectedDevice: ${connectedDevice.toString()},resultDevice: ${resultDevice.toString()},showLoading: ${showLoading.toString()},selectedOption: ${selectedOption.toString()},widgets: ${widgets.toString()},serialData: ${serialData.toString()},expandPanelOptions: ${expandPanelOptions.toString()}';
    return '{$string}';
  }
}
