
class Loan {
  final num id;
  final double amount;
  final double interestrate;
  final DateTime duedate;
  final num account;

  Loan({
    required this.id,
    required this.amount,
    required this.interestrate,
    required this.duedate,
    required this.account,
  });

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
      'id': id,
      'amount': amount,
      'interestrate': interestrate,
      'duedate': duedate.toIso8601String(),
      'account': account,
    };
  }
}
