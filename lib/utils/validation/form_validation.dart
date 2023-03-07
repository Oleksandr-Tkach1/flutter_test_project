class FormValidation {

  String passwordConfirm = '';

  static dynamic email(String value) {
    if (value.isEmpty) {
      return "Invalid name";
    }else {
      return null;
    }
  }

  dynamic password(String value) {
    passwordConfirm = value;
    if (value.isEmpty) {
      return "Invalid password";
    }else {
      return null;
    }
  }

  dynamic confirmPassword(String value){
    if(value.isEmpty || value != passwordConfirm){
      return 'Password not match';
    }else {
      return null;
    }
  }
}