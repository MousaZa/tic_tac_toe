enum FieldValue{
  X,
  O,
  empty
}

class Field {
  final int index;
  Field(this.index);
  FieldValue value = FieldValue.empty;
  bool isLocked = false;
  String getValue(){
    if(value == FieldValue.X) {
      return 'X';
    }else if(value == FieldValue.O){
      return 'O';
    }else{
      return '';
    }
  }
  bool setValue(String player){
    if(!isLocked){
      if(player == 'X') {
        value = FieldValue.X;
      }else if(player == 'O'){
        value = FieldValue.O;
      }
      lock();
      return true;
    }
    return false ;
  }

  void lock(){
    isLocked = true;
  }
  void unlock(){
    isLocked = false;
  }
  void reset(){
    value = FieldValue.empty;
    unlock();
  }
}