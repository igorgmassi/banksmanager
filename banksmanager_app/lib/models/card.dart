class BankCard { 
  final num _id;
  final String _cvv;
  final String _cardNumber;
  final DateTime _expirationDate;
  final String _cardType;
  final num _account; 

  BankCard({
    required num id,
    required String cvv,
    required String cardNumber,
    required DateTime expirationDate,
    required String cardType,
    required num account, 
  })  : _account = account,
        _cardType = cardType,
        _expirationDate = expirationDate,
        _cardNumber = cardNumber,
        _cvv = cvv,
        _id = id;

  factory BankCard.fromJson(Map<String, dynamic> json) {
    return BankCard(
      id: json['id'] as num, 
      cvv: json['cvv'] as String, 
      cardNumber: json['cardnumber'] as String, 
      expirationDate: DateTime.parse(json['expirationdate'] as String), 
      cardType: json['cardtype'] as String,
      account: json['account'] as num,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'cvv': _cvv,
      'cardnumber': _cardNumber,
      'expirationdate': _expirationDate.toIso8601String(),
      'cardtype': _cardType,
      'account': _account,
    };
  }

  // Getters para acessar os dados
  num get id => _id;
  String get cvv => _cvv;
  String get cardNumber => _cardNumber;
  DateTime get expirationDate => _expirationDate;
  String get cardType => _cardType;
  num get account => _account;
}