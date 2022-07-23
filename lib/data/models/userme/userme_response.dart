class UserMeResponse {
  String? id;
  String? firstName;
  String? lastName;
  String? middleName;
  String? phoneNumber;
  String? email;
  String? inn;
  String? dateOfBirth;
  String? profileImage;
  String? passportNumber;
  int? accountNumber;
  String? cityId;
  String? productId;
  String? adReference;

  UserMeResponse(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.phoneNumber,
      this.email,
      this.inn,
      this.dateOfBirth,
      this.profileImage,
      this.passportNumber,
      this.accountNumber,
      this.cityId,
      this.productId,
      this.adReference});

  UserMeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    inn = json['inn'];
    dateOfBirth = json['date_of_birth'];
    profileImage = json['profile_image'];
    passportNumber = json['passport_number'];
    accountNumber = json['account_number'];
    cityId = json['city_id'];
    productId = json['product_id'];
    adReference = json['ad_reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['middle_name'] = middleName;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['inn'] = inn;
    data['date_of_birth'] = dateOfBirth;
    data['profile_image'] = profileImage;
    data['passport_number'] = passportNumber;
    data['account_number'] = accountNumber;
    data['city_id'] = cityId;
    data['product_id'] = productId;
    data['ad_reference'] = adReference;
    return data;
  }
}
