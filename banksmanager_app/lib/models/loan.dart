class Loan {
  final num? _id;
  final double? _amount;
  final double? _interestrate;
  final DateTime? _duedate;
  final num? _account;

  Loan({
    num? id,
    double? amount,
    double? interestrate,
    DateTime? duedate,
    num? account,
  })  : _id = id,
        _amount = amount,
        _interestrate = interestrate,
        _duedate = duedate,
        _account = account;

  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json['id'] as num?,
      amount: json['amount'] != null ? double.tryParse(json['amount'].toString()) : null,
      interestrate: json['interestrate'] != null ? double.tryParse(json['interestrate'].toString()) : null,
      duedate: json['duedate'] != null ? DateTime.tryParse(json['duedate']) : null,
      account: json['account'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'amount': _amount,
      'interestrate': _interestrate,
      'duedate': _duedate?.toIso8601String(),
      'account': _account,
    };
  }

  num? get id => _id;
  double? get amount => _amount;
  double? get interestrate => _interestrate;
  DateTime? get duedate => _duedate;
  num? get account => _account;
}
