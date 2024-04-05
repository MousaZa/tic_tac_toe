import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/field.dart';

class HomeController extends GetxController {
  String player = 'X';

  List<Field> fields = List.generate(9, (index) => Field(index));

  void setField(int index) {
    if (fields[index].setValue(player)) {
      if (checkWinner(fields)) {
        playerWins(player);
        lockGame(fields);
        Future.delayed(const Duration(seconds: 5), () {
          player = 'X';
          resetGame(fields);
          update();
        });
      } else if (checkDraw(fields)) {
        draw();
        lockGame(fields);
        Future.delayed(const Duration(seconds: 5), () {
          player = 'X';
          resetGame(fields);
          update();
        });
      } else {
        changePlayer();
      }
      update();
    }
  }

  void changePlayer() {
    if (player == 'X') {
      player = 'O';
    } else {
      player = 'X';
    }
  }

  void resetGame(List<Field> fields) {
    for (var field in fields) {
      field.reset();
    }
  }
  void lockGame(List<Field> fields) {
    for (var field in fields) {
      field.lock();
    }
  }

  void playerWins(String player) {
    Get.snackbar('Winner', 'Player $player wins',
        duration: const Duration(seconds: 5),
        icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal:12.0),
          child: Text(
            player,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color:player == 'X' ? Colors.blue : Colors.red,
            ),
          ),
        ),
    );
  }

  void draw() {
    Get.snackbar('Draw', 'No one wins',
        duration: const Duration(seconds: 5),
        icon: Icon(
          Icons.handshake_outlined,
          color: Colors.black,
        ),
    );
  }

  bool checkWinner(List<Field> fields) {
    if (fields[0].value == fields[1].value &&
        fields[1].value == fields[2].value &&
        fields[0].value != FieldValue.empty) {
      return true;
    } else if (fields[3].value == fields[4].value &&
        fields[4].value == fields[5].value &&
        fields[3].value != FieldValue.empty) {
      return true;
    } else if (fields[6].value == fields[7].value &&
        fields[7].value == fields[8].value &&
        fields[6].value != FieldValue.empty) {
      return true;
    } else if (fields[0].value == fields[3].value &&
        fields[3].value == fields[6].value &&
        fields[0].value != FieldValue.empty) {
      return true;
    } else if (fields[1].value == fields[4].value &&
        fields[4].value == fields[7].value &&
        fields[1].value != FieldValue.empty) {
      return true;
    } else if (fields[2].value == fields[5].value &&
        fields[5].value == fields[8].value &&
        fields[2].value != FieldValue.empty) {
      return true;
    } else if (fields[0].value == fields[4].value &&
        fields[4].value == fields[8].value &&
        fields[0].value != FieldValue.empty) {
      return true;
    } else if (fields[2].value == fields[4].value &&
        fields[4].value == fields[6].value &&
        fields[2].value != FieldValue.empty) {
      return true;
    } else {
      return false;
    }
  }

  bool checkDraw(List<Field> fields) {
    for (Field field in fields) {
      if (field.value == FieldValue.empty) {
        return false;
      }
    }
    return true;
  }
}
