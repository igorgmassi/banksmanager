class Card {
  final num? _id;
  final String? _cvv;
  final String? _cardnumber;
  final DateTime? _expirationdate;
  final String? _cardtype;
  final num? _account;

  Card({
    num? id,
    String? cvv,
    String? cardnumber,
    DateTime? expirationdate,
    String? cardtype,
    num? account,
  })  : _id = id,
        _cvv = cvv,
        _cardnumber = cardnumber,
        _expirationdate = expirationdate,
        _cardtype = cardtype,
        _account = account;

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'] as num?,
      cvv: json['cvv'] as String?,
      cardnumber: json['cardnumber'] as String?,
      expirationdate: json['expirationdate'] != null ? DateTime.tryParse(json['expirationdate']) : null,
      cardtype: json['cardtype'] as String?,
      account: json['account'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'cvv': _cvv,
      'cardnumber': _cardnumber,
      'expirationdate': _expirationdate?.toIso8601String(),
      'cardtype': _cardtype,
      'account': _account,
    };
  }

  num? get id => _id;
  String? get cvv => _cvv;
  String? get cardnumber => _cardnumber;
  DateTime? get expirationdate => _expirationdate;
  String? get cardtype => _cardtype;
  num? get account => _account;
}