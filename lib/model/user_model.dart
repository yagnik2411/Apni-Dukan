class UserModel {
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;

  UserModel({this.firstName, this.lastName, this.emailAddress});

  // Getter and setter for firstName
  String? get getFirstName => firstName;
  setFirstName(String firstName) => this.firstName = firstName;

  // Getter and setter for lastName
  String? get getLastName => lastName;
  setLastName(String lastName) => this.lastName = lastName;

  // Getter and setter for emailAddress
  String? get getEmailAddress => emailAddress;
  setEmailAddress(String emailAddress) => this.emailAddress = emailAddress;

  String? get getPhoneNumber => phoneNumber;
  setPhoneNumber(String phoneNumber) => this.phoneNumber = phoneNumber;

  void setAllParameters(
      {String? firstName,
      String? lastName,
      String? emailAddress,
      String? phoneNumber}) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.emailAddress = emailAddress;
    this.phoneNumber = phoneNumber;
  }

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'emailAddress': emailAddress,
      };

  // Create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        emailAddress: json['emailAddress'],
      );
}
