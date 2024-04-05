import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controller/home_controller.dart';
import 'package:tic_tac_toe/model/field_button.dart';

import '../model/field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: GetBuilder(
        init: HomeController(),
        builder: (HomeController controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GridView.count(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  return Container(
                      padding: const EdgeInsets.all(10),
                      child: FieldButton(
                        field: controller.fields[index],
                        onPressed: () {
                            controller.setField(index);
                        },
                      ));
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'it\'s  ',
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    controller.player,
                    style:  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: controller.player == 'X' ? Colors.blue : Colors.red),
                  ),
                  Text(
                    '  turn',
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
