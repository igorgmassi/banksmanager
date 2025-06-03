
class Account {
  final num ?_id;
  final String? _agency;
  final double _balance;
  final String _accountnumber;
  final String _accounttype;
  final num _user;

  Account({
    num? id,
    String? agency,
    required double balance,
    required String accountnumber,
    required String accounttype,
    required num user,
  })  : _id = id,
        _agency = agency,
        _balance = balance,
        _accountnumber = accountnumber,
        _accounttype = accounttype,
        _user = user;

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'] as num?,
      agency: json['agency'] as String?,
      balance: double.tryParse(json['balance'].toString()) ?? 0.0,
      accountnumber: json['accountnumber'] as String,
      accounttype: json['accounttype'] as String,
      user: json['user'] as num,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'agency': _agency,
      'balance': _balance,
      'accountnumber': _accountnumber,
      'accounttype': _accounttype,
      'user': _user,
    };
  }

  num? get id => _id;
  String? get agency => _agency;
  double get balance => _balance;
  String get accountnumber => _accountnumber;
  String get accounttype => _accounttype;
  num get user => _user;
 

  

}
