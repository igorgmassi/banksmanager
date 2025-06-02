class Card{
  final num _id;
  final String _cvv;
  final String _cardnumber;
  final DateTime _expirationdate;
  final String _cardtype;
  final num _account;

  Card({
    required num id,
    required String cvv,
    required String cardnumber,
    required DateTime expirationdate,
    required String cardtype,
    required num account,
  }) : _account = account, _cardtype = cardtype, _expirationdate = expirationdate, _cardnumber = cardnumber, _cvv = cvv, _id = id;

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'] as num,
      cvv: json['cvv'] as String,
      cardnumber: json['cardnumber'] as String,
      expirationdate: DateTime.parse(json['expirationdate'] as String),
      cardtype: json['cardtype'] as String,
      account: json['account'] as num,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'cvv': _cvv,
      'cardnumber': _cardnumber,
      'expirationdate': _expirationdate.toIso8601String(),
      'cardtype': _cardtype,
      'account': _account,
    };
  }

  num get id => _id;
  String get cvv => _cvv;
  String get cardnumber => _cardnumber;
  DateTime get expirationdate => _expirationdate;
  String get cardtype => _cardtype;
  num get account => _account;
  
}