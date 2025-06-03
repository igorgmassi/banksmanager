
class Account {
  final num ?_id;
  final double balance;
  final String _accountnumber;
  final String _accounttype;
  final num _user;

  Account({
    num ?id,
    required this.balance,
    required String accountnumber,
    required String accounttype,
    required num user,
  }) : _user = user, _accounttype = accounttype, _accountnumber = accountnumber, _id = id;

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'] as num,
      balance: double.tryParse(json['balance'].toString()) as double,
      accountnumber: json['accountnumber'] as String,
      accounttype: json['accounttype'] as String,
      user: json['user'] as num,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'balance': balance,
      'accountnumber': _accountnumber,
      'accounttype': _accounttype,
      'user': _user,
    };
  }

  num? get id => _id;
  String get accountnumber => _accountnumber;
  String get accounttype => _accounttype;
  num get user => _user;

}
