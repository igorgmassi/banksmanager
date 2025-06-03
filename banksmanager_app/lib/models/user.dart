
class User {
  final num _id;
  final String _name;
  final String _email;
  final String _cpf;
  final String _password;

  User({
    required num id,
    required String name,
    required String email,
    required String cpf,
    required String password,
  }) : _password = password, _cpf = cpf, _email = email, _name = name, _id = id;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as num,
      name: json['name'] as String,
      email: json['email'] as String,
      cpf: json['cpf'] as String,
      password: json['password'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'name': _name,
      'email': _email,
      'cpf': _cpf,
      'password': _password,
    };
  }

  num get id => _id;
  String get name => _name;
  String get email => _email;
  String get cpf => _cpf;
  String get password => _password;
  
}