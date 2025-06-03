class Transaction {
  final num? _id;
  final double? _amount;
  final DateTime? _transactiondate;
  final String? _transactiontype;
  final String? _description;
  final num? _account;

  Transaction({
    num? id,
    double? amount,
    DateTime? transactiondate,
    String? transactiontype,
    String? description,
    num? account,
  })  : _id = id,
        _amount = amount,
        _transactiondate = transactiondate,
        _transactiontype = transactiontype,
        _description = description,
        _account = account;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as num?,
      amount: json['amount'] != null ? double.tryParse(json['amount'].toString()) : null,
      transactiondate: json['transactiondate'] != null ? DateTime.tryParse(json['transactiondate']) : null,
      transactiontype: json['transactiontype'] as String?,
      description: json['description'] as String?,
      account: json['account'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'amount': _amount,
      'transactiondate': _transactiondate?.toIso8601String(),
      'transactiontype': _transactiontype,
      'description': _description,
      'account': _account,
    };
  }

  num? get id => _id;
  double? get amount => _amount;
  DateTime? get transactiondate => _transactiondate;
  String? get transactiontype => _transactiontype;
  String? get description => _description;
  num? get account => _account;
}