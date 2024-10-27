class RegisterModel {
  final String email;
  final String name;
  final String phone;
  final String password;

  RegisterModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
  });

  Map<String,dynamic>toJson(){
    return {
      'email': email,
      'name' : name,
      'phone' : phone,
      'password': password,
    };
  }

  factory RegisterModel.fromJson(Map<String,dynamic>json){
    return RegisterModel(
        email: json['email'] ?? " ",
        name: json['name'] ?? " ",
        phone: json['phone'] ?? " ",
        password: json['password'] ?? " "
    );
  }

}