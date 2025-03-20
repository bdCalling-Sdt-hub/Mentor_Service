class MentorMenteeFindModel {
  int? code;
  String? message;
  MentorMenteeFindData? data;

  MentorMenteeFindModel({this.code, this.message, this.data});

  MentorMenteeFindModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new MentorMenteeFindData.fromJson(json['data']) : null;
  }
}

class MentorMenteeFindData {
  List<MentorMenteeFindAttributes>? attributes;

  MentorMenteeFindData({this.attributes});

  MentorMenteeFindData.fromJson(Map<String, dynamic> json) {
    if (json['attributes'] != null) {
      attributes = <MentorMenteeFindAttributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new MentorMenteeFindAttributes.fromJson(v));
      });
    }
  }
}

class MentorMenteeFindAttributes {
  String? sId;
  String? firstName;
  String? lastName;
  ProfileImage? profileImage;
  String? branch;
  String? currentStatus;
  String? email;
  String? description;

  MentorMenteeFindAttributes(
      {this.sId,
        this.firstName,
        this.lastName,
        this.profileImage,
        this.branch,
        this.currentStatus,
        this.email,
        this.description
      });

  MentorMenteeFindAttributes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'] != null
        ? new ProfileImage.fromJson(json['profile_image'])
        : null;
    branch = json['branch'];
    currentStatus = json['current_status'];
    email = json['email'];
    description = json['description'];
  }
}

class ProfileImage {
  String? imageUrl;
  String? sId;

  ProfileImage({this.imageUrl, this.sId});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    sId = json['_id'];
  }
}
