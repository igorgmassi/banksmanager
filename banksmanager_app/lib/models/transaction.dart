
class Transaction {
  final num _id;
  final double _amount;
  final DateTime _transactiondate;
  final String _transactiontype;
  final String _description;
  final num _account;


  Transaction({
    required num id,
    required double amount,
    required DateTime transactiondate,
    required String transactiontype,
    required String description,
    required num account,
  }) : _account = account, _description = description, _transactiontype = transactiontype, _transactiondate = transactiondate, _amount = amount, _id = id;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as num,
      amount: double.tryParse(json['amount'].toString()) as double,
      transactiondate: DateTime.parse(json['transactiondate'] as String),
      transactiontype: json['transactiontype'] as String,
      description: json['description'] as String,
      account: json['account'] as num,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'amount': _amount,
      'transactiondate': _transactiondate.toIso8601String(),
      'transactiontype': _transactiontype,
      'description': _description,
      'account': _account,
    };
  }

  num get id => _id;
  double get amount => _amount;
  DateTime get transactiondate => _transactiondate;
  String get transactiontype => _transactiontype;
  String get description => _description;
  num get account => _account;
}