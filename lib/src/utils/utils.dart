
bool validacionNumero(String s) {
  if(s.isEmpty) return false;
  final n = num.tryParse(s);
  if(n == null){
    return false;
  }else {
    if(n >= 0 && n <= 100){
      return true;
    } 
    return false;
  }
}

bool validacionArea(String s) {
  if(s.isEmpty) return false;
  final n = num.tryParse(s);
  if(n == null){
    return false;
  }else {
    if(n >= 0 && n <= 100){
      return true;
    } 
    return false;
  }
}