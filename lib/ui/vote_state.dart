import 'package:flutter/material.dart';

class RadioListValue {
  final int key;
  final Color color;
  final String label;
  RadioListValue(this.key, this.color, this.label);
}

class VoteState with ChangeNotifier {
  RadioListValue _backGroundColor =
      new RadioListValue(1, Colors.white, "White");
  RadioListValue _fontColor = new RadioListValue(0, Colors.black, "Black");

  RadioListValue get backGroundColor => _backGroundColor;
  RadioListValue get fontColor => _fontColor;

  void setBackGroundColor(RadioListValue newBackGroundColor) {
    _backGroundColor = newBackGroundColor;
    notifyListeners();
  }

  void setFontColor(RadioListValue newFontColor) {
    _fontColor = newFontColor;
    notifyListeners();
  }
}
