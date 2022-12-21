import 'dart:html';

import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

class NumField extends Component with ValueChangeEventSource<num>, MixinDisable implements StateComponent<num> {
  NumField() : super('NumField') {
    numberInput.style
      ..width = '100%'
      ..flexGrow = '1';
    element.children.add(numberInput);
    numberInput.onInput.listen((event) {
      fireValueChange(value, value);
    });
    numberInput.onBlur.listen((event) => numberInput.value = value.toString());
  }

  @override
  DivElement element = DivElement();

  @override
  List<Element> get disableElements => [numberInput];
  TextInputElement numberInput = TextInputElement();

  @override
  set width(String width) {
    numberInput.style.width = width;
    element.style.width = width;
  }

  @override
  set height(String height) {
    element.style.height = height;
  }

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
