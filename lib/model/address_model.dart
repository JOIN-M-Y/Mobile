class Address{
  List<String> address;
  Address({this.address});
  factory Address.fromJson(List<dynamic> param) => Address(
    address: param.cast<String>()
  );
}