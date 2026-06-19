class  RegisterRequestModel {
  String username;
  String email;
  String phone;
  String password;
  String passwordConfirmation;
  int agreeTerms;

   RegisterRequestModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.agreeTerms,
  });


  factory  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return  RegisterRequestModel(
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      passwordConfirmation: json['password_confirmation'],
      agreeTerms: json['agree_terms'],
    );
  }
   
    Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'agree_terms': agreeTerms,
    };
  }
  
  
}

