class Login_Model{
  String email;
  String password;

  Login_Model({required this.email,required this.password});

  factory Login_Model.fromSQl({required Map data}){
    return Login_Model(email: data['email'], password: data['password']);
  }

}