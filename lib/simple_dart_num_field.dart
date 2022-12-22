import 'dart:html';

import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

class NumField extends Component with ValueChangeEventSource<num>, MixinDisable implements StateComponent<num> {
  NumField() : super('NumField') {
    numberInput.style
      ..width = '100%'
      ..flexGrow = '1';
    numberInput.onInput.listen((event) {
      fireValueChange(value, value);
    });
    numberInput.onBlur.listen((event) => numberInput.value = value.toString());
  }

  @override
  Element get element => numberInput;

  TextInputElement numberInput = TextInputElement();

  num get value => num.tryParse(numberInput.value!) ?? 0;

  set value(num value) => numberInput.value = value.toString();

  @override
  String get state => value.toString();

  @override
  set state(String newValue) => num.tryParse(numberInput.value!) ?? 0;

  void focus() {
    numberInput.focus();
  }
}
