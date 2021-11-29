class AuthenticationInfo {
  final String? email;
  final String? givenName;
  final String? surname;
  final String? displayName;
  final String? mobilePhone;
  // final List businessPhone;
  final String? jobTitle;
  final String? favoriteLanguage;
  final String? officeLocation;
  final String? id;

  // final List<LocationFact> facts;

  AuthenticationInfo(
      {this.email,
      this.givenName,
      this.surname,
      this.displayName,
      this.mobilePhone,
      // this.businessPhone,
      this.jobTitle,
      this.favoriteLanguage,
      this.officeLocation,
      this.id});

  factory AuthenticationInfo.fromJson(Map<String, dynamic> json) {
    return AuthenticationInfo(
      email: json['mail'],
      givenName: json['givenName'],
      surname: json['surname'],
      displayName: json['displayName'],
      mobilePhone: json['mobilePhone'],
      // businessPhone: json['businessPhones'][0],
      jobTitle: json['jobTitle'],
      favoriteLanguage: json['prefferedLanguage'],
      officeLocation: json['officeLocation'],
      id: json['id'],
    );
  }
}
