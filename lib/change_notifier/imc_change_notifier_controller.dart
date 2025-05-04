
import 'dart:math';

import 'package:flutter/material.dart';

class ImcChangeNotifierController extends ChangeNotifier {
  var imc = 0.0;

  Future<void> calcularIMC({required double peso, required double altura}) async {
    notifyListeners();
    imc = 0;
    await Future.delayed(Duration(seconds: 1));
    imc = peso/ pow(altura, 2);
    notifyListeners();
  }
}