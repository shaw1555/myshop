class UserProfile {
  String userId;
  String userName;
  String? phoneNo;

  UserProfile({
    required this.userId,
    required this.userName,
    this.phoneNo,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userId: json['userId'],
      userName: json['userName'],
      phoneNo: json['phoneNo']
    );
  }
}
