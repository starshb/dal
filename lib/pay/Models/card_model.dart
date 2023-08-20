class CreditCardModel {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool showBackView;

  CreditCardModel(
      {required this.cardNumber,
      required this.expiryDate,
      required this.cardHolderName,
      required this.cvvCode,
      required this.showBackView});
}

List<CreditCardModel> listData = [
  CreditCardModel(
      cardHolderName: 'Alice',
      cardNumber: '5242424242424242',
      cvvCode: '124',
      expiryDate: '01-02-03',
      showBackView: true),
];
