class Card{
  final String id;
  final String cvv;
  final String cardnumber;
  final DateTime expirationdate;
  final String cardtype;
  final String account;

  Card({
    required this.id,
    required this.cvv,
    required this.cardnumber,
    required this.expirationdate,
    required this.cardtype,
    required this.account,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'] as String,
      cvv: json['cvv'] as String,
      cardnumber: json['cardnumber'] as String,
      expirationdate: DateTime.parse(json['expirationdate'] as String),
      cardtype: json['cardtype'] as String,
      account: json['account'] as String,
    );
  }
}