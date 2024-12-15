class Validators {
  static final RegExp _numeric = RegExp(r'^-?[0-9]+$');

  /// check if the string [str] contains only numbers
  static bool isNumeric(String str) {
    return _numeric.hasMatch(str);
  }

  static bool isURL(String? str) {
    if ((str?.startsWith('http') ?? false) ||
        (str?.startsWith('https') ?? false)) {
      return true;
    } else {
      return false;
    }
  }


  static bool phoneNumber(String str){
    if(isNumeric(str)){
      if(str.length == 9 ){
        return true ; 
      }else{
        return false ; 
      }
    }else{
      return false ; 
    }
  }


  
}
