
class Transaction {
  final num id;
  final double amount;
  final DateTime transactiondate;
  final String transactiontype;
  final String description;
  final num account;


  Transaction({
    required this.id,
    required this.amount,
    required this.transactiondate,
    required this.transactiontype,
    required this.description,
    required this.account,
  });

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
      'id': id,
      'amount': amount,
      'transactiondate': transactiondate.toIso8601String(),
      'transactiontype': transactiontype,
      'description': description,
      'account': account,
    };
  }
}