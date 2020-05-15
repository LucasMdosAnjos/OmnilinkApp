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

  final _$widgetsAtom = Atom(name: '_FormmsgformatadaControllerBase.widgets');

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

  final _$bufferFormAtom =
      Atom(name: '_FormmsgformatadaControllerBase.bufferForm');

  @override
  Map<String, String> get bufferForm {
    _$bufferFormAtom.context.enforceReadPolicy(_$bufferFormAtom);
    _$bufferFormAtom.reportObserved();
    return super.bufferForm;
  }

  @override
  set bufferForm(Map<String, String> value) {
    _$bufferFormAtom.context.conditionallyRunInAction(() {
      super.bufferForm = value;
      _$bufferFormAtom.reportChanged();
    }, _$bufferFormAtom, name: '${_$bufferFormAtom.name}_set');
  }

  final _$enviandoFormAtom =
      Atom(name: '_FormmsgformatadaControllerBase.enviandoForm');

  @override
  bool get enviandoForm {
    _$enviandoFormAtom.context.enforceReadPolicy(_$enviandoFormAtom);
    _$enviandoFormAtom.reportObserved();
    return super.enviandoForm;
  }

  @override
  set enviandoForm(bool value) {
    _$enviandoFormAtom.context.conditionallyRunInAction(() {
      super.enviandoForm = value;
      _$enviandoFormAtom.reportChanged();
    }, _$enviandoFormAtom, name: '${_$enviandoFormAtom.name}_set');
  }

  final _$_FormmsgformatadaControllerBaseActionController =
      ActionController(name: '_FormmsgformatadaControllerBase');

  @override
  void buildForm() {
    final _$actionInfo =
        _$_FormmsgformatadaControllerBaseActionController.startAction();
    try {
      return super.buildForm();
    } finally {
      _$_FormmsgformatadaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo =
        _$_FormmsgformatadaControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_FormmsgformatadaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'value: ${value.toString()},widgets: ${widgets.toString()},bufferForm: ${bufferForm.toString()},enviandoForm: ${enviandoForm.toString()}';
    return '{$string}';
  }
}
