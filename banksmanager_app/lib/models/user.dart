class User {
  final num? _id;
  final String? _name;
  final String? _email;
  final String? _cpf;
  final String? _password;

  User({
    num? id,
    String? name,
    String? email,
    String? cpf,
    String? password,
  })  : _id = id,
        _name = name,
        _email = email,
        _cpf = cpf,
        _password = password;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as num?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      cpf: json['cpf'] as String?,
      password: json['password'] as String?,
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

  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get cpf => _cpf;
  String? get password => _password;
}