
class Account {
  final String id;
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
      id: json['id'] as String,
      balance: json['balance'] as double,
      accountnumber: json['accountnumber'] as String,
      accounttype: json['accounttype'] as String,
      user: json['user'] as String,
    );
  }
}
