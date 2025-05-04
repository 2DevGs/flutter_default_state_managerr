import 'package:flutter/material.dart';
import 'package:flutter_default_state_managerr/bloc_pattern/imc_block_pattern_page.dart';
import 'package:flutter_default_state_managerr/change_notifier/imc_change_notifier_page.dart';
import 'package:flutter_default_state_managerr/setState/imc_setstate_page.dart';
import 'package:flutter_default_state_managerr/value_notifier/value_notifier_page.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}): super(key: key);

  void _goToPage(BuildContext context,Widget page){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page,
      )
    );
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Home Page'),),
           body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _goToPage(context, ImcSetstatePage()), 
                  child: const Text('setState')
                  ),
                  ElevatedButton(
                  onPressed: () => _goToPage(context, ValueNotifierPage()), 
                  child: const Text('ValueNotifier')
                  ),
                  ElevatedButton(
                  onPressed: () => _goToPage(context, ImcChangeNotifierPage()), 
                  child: const Text('ChangeNotifier')
                  ),
                  ElevatedButton(
                  onPressed: () => _goToPage(context, ImcBlocPatternPage()), 
                  child: const Text('Bloc Pattern (Streams)')
                  ),
              ],
            ),
            ),
       );
  }
}