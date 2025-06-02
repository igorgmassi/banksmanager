
class Loan {
  final num _id;
  final double _amount;
  final double _interestrate;
  final DateTime _duedate;
  final num _account;

  Loan({
    required num id,
    required double amount,
    required double interestrate,
    required DateTime duedate,
    required num account,
  }) : _account = account, _duedate = duedate, _interestrate = interestrate, _amount = amount, _id = id;

  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json['id'] as num,
      amount: double.tryParse(json['amount'].toString()) as double,
      interestrate: double.tryParse(json['interestrate'].toString()) as double,
      duedate: DateTime.parse(json['duedate'] as String),
      account: json['account'] as num,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'amount': _amount,
      'interestrate': _interestrate,
      'duedate': _duedate.toIso8601String(),
      'account': _account,
    };
  }

  num get id => _id;
  double get amount => _amount;
  double get interestrate => _interestrate;
  DateTime get duedate => _duedate;
  num get account => _account;
  
}
