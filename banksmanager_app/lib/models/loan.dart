
class Loan {
  final String id;
  final double amount;
  final double interestrate;
  final DateTime duedate;
  final String account;

  Loan({
    required this.id,
    required this.amount,
    required this.interestrate,
    required this.duedate,
    required this.account,
  });

  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json['id'] as String,
      amount: json['amount'] as double,
      interestrate: json['interestrate'] as double,
      duedate: DateTime.parse(json['duedate'] as String),
      account: json['account'] as String,
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
