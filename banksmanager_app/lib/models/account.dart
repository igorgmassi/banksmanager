
class Account {
  final num id;
  final double balance;
  final String accountnumber;
  final String accounttype;
  final String user;

  Account({
    required this.id,
    required this.balance,
    required this.accountnumber,
    required this.accounttype,
    required this.user,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'] as num,
      balance: json['balance'] as double,
      accountnumber: json['accountnumber'] as String,
      accounttype: json['accounttype'] as String,
      user: json['user'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'balance': balance,
      'accountnumber': accountnumber,
      'accounttype': accounttype,
      'user': user,
    };
  }
}
