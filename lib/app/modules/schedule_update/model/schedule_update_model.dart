class ScheduleUpdateModel {
  int? code;
  String? message;
  ScheduleUpdateData? data;

  ScheduleUpdateModel({this.code, this.message, this.data});

  ScheduleUpdateModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new ScheduleUpdateData.fromJson(json['data']) : null;
  }

}

class ScheduleUpdateData {
  ScheduleUpdateAttributes? attributes;

  ScheduleUpdateData({this.attributes});

  ScheduleUpdateData.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? new ScheduleUpdateAttributes.fromJson(json['attributes'])
        : null;
  }
}

class ScheduleUpdateAttributes {
  String? sId;
  DateTime? appointmentDate;
  String? appointmentTime;
  String? status;
  String? creator;
  String? typeOfLink;
  String? link;
  String? description;
  String? scheduleType;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ScheduleUpdateAttributes(
      {this.sId,
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
        this.iV});

  ScheduleUpdateAttributes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    appointmentDate = DateTime.parse(json['appointment_date'].toString()) ;
    appointmentTime = json['appointment_time'];
    status = json['status'];
    creator = json['creator'];
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
