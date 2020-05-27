// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formmsgformatada_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormmsgformatadaController on _FormmsgformatadaControllerBase, Store {
  final _$valueAtom = Atom(name: '_FormmsgformatadaControllerBase.value');

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

  final _$widgetsAtom = Atom(name: '_FormmsgformatadaControllerBase.widgets');

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

  final _$bufferFormAtom =
      Atom(name: '_FormmsgformatadaControllerBase.bufferForm');

  @override
  Map<String, String> get bufferForm {
    _$bufferFormAtom.reportRead();
    return super.bufferForm;
  }

  @override
  set bufferForm(Map<String, String> value) {
    _$bufferFormAtom.reportWrite(value, super.bufferForm, () {
      super.bufferForm = value;
    });
  }

  final _$enviandoFormAtom =
      Atom(name: '_FormmsgformatadaControllerBase.enviandoForm');

  @override
  bool get enviandoForm {
    _$enviandoFormAtom.reportRead();
    return super.enviandoForm;
  }

  @override
  set enviandoForm(bool value) {
    _$enviandoFormAtom.reportWrite(value, super.enviandoForm, () {
      super.enviandoForm = value;
    });
  }

  final _$_FormmsgformatadaControllerBaseActionController =
      ActionController(name: '_FormmsgformatadaControllerBase');

  @override
  void buildForm() {
    final _$actionInfo = _$_FormmsgformatadaControllerBaseActionController
        .startAction(name: '_FormmsgformatadaControllerBase.buildForm');
    try {
      return super.buildForm();
    } finally {
      _$_FormmsgformatadaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_FormmsgformatadaControllerBaseActionController
        .startAction(name: '_FormmsgformatadaControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_FormmsgformatadaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
widgets: ${widgets},
bufferForm: ${bufferForm},
enviandoForm: ${enviandoForm}
    ''';
  }
}
