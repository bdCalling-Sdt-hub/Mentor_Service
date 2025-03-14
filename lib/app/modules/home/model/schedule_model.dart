class ScheduleModel {
  int? code;
  String? message;
  ScheduleData? data;

  ScheduleModel({this.code, this.message, this.data});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? ScheduleData.fromJson(json['data']) : null;
  }
}

class ScheduleData {
  ScheduleAttributes? attributes;

  ScheduleData({this.attributes});

  ScheduleData.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? ScheduleAttributes.fromJson(json['attributes'])
        : null;
  }
}

class ScheduleAttributes {
  List<ScheduleResults>? results;
  int? page;
  int? limit;
  int? totalPages;
  int? totalResults;

  ScheduleAttributes(
      {this.results,
      this.page,
      this.limit,
      this.totalPages,
      this.totalResults});

  ScheduleAttributes.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ScheduleResults>[];
      json['results'].forEach((v) {
        results!.add(ScheduleResults.fromJson(v));
      });
    }
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    totalResults = json['totalResults'];
  }
}

class ScheduleResults {
  String? sId;
  DateTime? appointmentDate;
  String? appointmentTime;
  String? status;
  Creator? creator;
  String? typeOfLink;
  String? link;
  String? description;
  String? scheduleType;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ScheduleResults({
    this.sId,
    this.appointmentDate,
    this.appointmentTime,
    this.status,
    this.creator,
    this.typeOfLink,
    this.link,
    this.description,
    this.scheduleType,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  ScheduleResults.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    appointmentDate = json['appointment_date'] != null &&
            (json['appointment_date'] as String).isNotEmpty
        ? DateTime.tryParse(json['appointment_date'] as String)
        : DateTime.tryParse('');
    appointmentTime = json['appointment_time'];
    status = json['status'];
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    typeOfLink = json['type_of_link'];
    link = json['link'];
    description = json['description'];
    scheduleType = json['scheduleType'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class Creator {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  ProfileImage? profileImage;
  String? branch;
  String? id;

  Creator(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.profileImage,
      this.branch,
      this.id});

  Creator.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    profileImage = json['profile_image'] != null
        ? ProfileImage.fromJson(json['profile_image'])
        : null;
    branch = json['branch'];
    id = json['id'];
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
