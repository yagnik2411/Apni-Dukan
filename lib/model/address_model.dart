class AddressModel {
  String? address;
  String? city;
  String? state;
  String? pinCode;

  AddressModel({this.address, this.city, this.state, this.pinCode});

  // Setter for all parameters
  void setAllParameters(
      {String? address, String? city, String? state, String? pinCode}) {
    this.address = address;
    this.city = city;
    this.state = state;
    this.pinCode = pinCode;
  }

  // Convert AddressModel to JSON
  Map<String, dynamic> toJson() => {
        'address': address,
        'city': city,
        'state': state,
        'pinCode': pinCode,
      };

  // Create an AddressModel from JSON
  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        address: json['address'],
        city: json['city'],
        state: json['state'],
        pinCode: json['pinCode'],
      );
}
