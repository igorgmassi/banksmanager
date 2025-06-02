
class User {
  final num id;
  final String name;
  final String email;
  final String cpf;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.cpf,
    required this.password,
  });

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
      'id': id,
      'name': name,
      'email': email,
      'cpf': cpf,
      'password': password,
    };
  }
}