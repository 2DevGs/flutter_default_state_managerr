import 'dart:math';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_default_state_managerr/change_notifier/imc_change_notifier_controller.dart';
import 'package:flutter_default_state_managerr/widgets/imc_gauge.dart';
import 'package:flutter_default_state_managerr/widgets/imc_gauge_range.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcChangeNotifierPage extends StatefulWidget {

  const ImcChangeNotifierPage({ Key? key }) : super(key: key);

  @override
  State<ImcChangeNotifierPage> createState() => _ImcChangeNotifierPageState();
}

class _ImcChangeNotifierPageState extends State<ImcChangeNotifierPage> {

  final controller = ImcChangeNotifierController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();
    return super.dispose();
  }

   @override
   Widget build(BuildContext context) {
    print('BUILD TELA');
    print('-------------------------------------------------------------------------------------');
       return Scaffold(
        appBar: AppBar(title: const Text('Imc Change Notifier'),),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AnimatedBuilder(
                      animation: controller, 
                      builder: (context, child) {
                        print('-------------------------------------------------------------------------------------');
                        print('BUILD AnimatedBuilder');
                        return ImcGauge(imc: controller.imc);
                      },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: pesoEC,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Peso',),
                      inputFormatters: [
                        CurrencyTextInputFormatter.currency(
                          locale: 'pt_BR',
                          symbol: '',
                          decimalDigits: 2,
                          turnOffGrouping: true,
                        ),
                      ],
                      validator: (String? value){
                        if(value == null || value.isEmpty){
                          return 'Peso Obrigatório';
                        }
                      },
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: alturaEC,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Altura',),
                      inputFormatters: [
                        CurrencyTextInputFormatter.currency(
                          locale: 'pt_BR',
                          symbol: '',
                          decimalDigits: 2,
                          turnOffGrouping: true,
                        ),
                      ],
                      validator: (String? value){
                        if(value == null || value.isEmpty){
                          return 'Altura Obrigatória';
                        }
                      },
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: (){
                        var formValid = formKey.currentState?.validate() ?? false;
                        if(formValid) {
                        var formatter = NumberFormat.simpleCurrency(
                          locale: 'pt_BR', decimalDigits: 2);

                          double peso = formatter.parse(pesoEC.text) as double;
                          double altura = formatter.parse(alturaEC.text) as double;

                          controller.calcularIMC(peso: peso, altura: altura);
                        }
              
                      },
                      child: Text('Calcular IMC'),
                    ),
                  ],
                ),
              ),
            ), 
           ),
       );
   }
}