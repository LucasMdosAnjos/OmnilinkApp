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

  final _$textAtom = Atom(name: '_BluetoothControllerBase.text');

  @override
  String get text {
    _$textAtom.context.enforceReadPolicy(_$textAtom);
    _$textAtom.reportObserved();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.context.conditionallyRunInAction(() {
      super.text = value;
      _$textAtom.reportChanged();
    }, _$textAtom, name: '${_$textAtom.name}_set');
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
  void disposeObjects() {
    final _$actionInfo =
        _$_BluetoothControllerBaseActionController.startAction();
    try {
      return super.disposeObjects();
    } finally {
      _$_BluetoothControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'value: ${value.toString()},devices: ${devices.toString()},text: ${text.toString()}';
    return '{$string}';
  }
}
