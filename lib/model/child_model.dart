import 'package:get/get.dart';

class ChildInfoListModel {
  final childildren = <ChildInfoModel>[].obs;
  ChildInfoListModel();
}

class ChildInfoModel {
  ChildData? childData;

  ChildInfoModel({this.childData});

  ChildInfoModel.fromJson(Map<dynamic, dynamic> json) {
    childData = json['child_data'] != null
        ? new ChildData.fromJson(json['child_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.childData != null) {
      data['child_data'] = this.childData!.toJson();
    }
    return data;
  }
}

class ChildData {
  int? id;
  String? name1;
  String? name2;
  String? name3;
  String? name4;
  String? nameLast;
  String? nameMother;
  String? birthday;
  int? gander;
  int? connectionType;
  int? studyType;
  int? cardType;
  int? personalCase;
  CardInfo? cardInfo;
  int? locationWithFather;
  int? haveAwork;
  int? workType;
  String? pathF;
  String? pathB;
  String? fatherImage;
  int? workPlace;
  String? workTitle;
  String? salary;
  ExtraDataModel? extraDataModel;
  ChildData(
      {this.name1,
      this.name2,
      this.name3,
      this.name4,
      this.nameLast,
      this.nameMother,
      this.birthday,
      this.gander,
      this.connectionType,
      this.studyType,
      this.cardType,
      this.cardInfo,
      this.locationWithFather,
      this.haveAwork,
      this.workType,
      this.id,
      this.pathB,
      this.pathF,
      this.personalCase,
      this.salary,
      this.workPlace,
      this.workTitle,
      this.extraDataModel,
      this.fatherImage});

  ChildData.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name1 = json['name1'];
    name2 = json['name2'];
    name3 = json['name3'];
    name4 = json['name4'];
    nameLast = json['name_last'];
    nameMother = json['name_mother'];
    birthday = json['birthday'];
    gander = json['gander'];
    personalCase = json['personal_case'];
    connectionType = json['connection_type'];
    studyType = json['study_type'];
    cardType = json['card_type'];
    fatherImage = json['father_image'];
    try {
      cardInfo = json['card_info'] != null
          ? new CardInfo.fromJson(json['card_info'])
          : null;
    } catch (e) {}
    locationWithFather = json['location_with_father'];
    haveAwork = json['have_awork'];
    workType = json['work_type'];

    workPlace = json['work_place'];

    workTitle = json['work_title'];
    salary = json['salary'];
    pathF = json['pathf'];
    pathB = json['pathb'];
    try {
      extraDataModel = ExtraDataModel.fromJson(json["extra_data"]);
    } catch (e) {}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name1'] = this.name1;
    data['name2'] = this.name2;
    data['name3'] = this.name3;
    data['name4'] = this.name4;
    data['name_last'] = this.nameLast;
    data['name_mother'] = this.nameMother;
    data['birthday'] = this.birthday;
    data['gander'] = this.gander;
    data['connection_type'] = this.connectionType;
    data['study_type'] = this.studyType;
    data['card_type'] = this.cardType;
    data['personal_case'] = personalCase;
    data['father_image'] = fatherImage;
    data['pathf'] = pathF;
    data['pathb'] = pathB;
    data['father_image'] = fatherImage;
    if (this.cardInfo != null) {
      data['card_info'] = this.cardInfo!.toJson();
    }
    data['location_with_father'] = this.locationWithFather;
    data['have_awork'] = this.haveAwork;
    data['work_type'] = this.workType;

    try {
      data['work_place'] = workPlace;

      data['work_title'] = workTitle;
      data['salary'] = salary;
    } catch (e) {}
    try {
      data["extra_data"] = extraDataModel?.toJson();
    } catch (e) {}
    return data;
  }
}

class CardInfo {
  int? cardType;
  String? nationalNumber;
  String? familyNumber;
  String? releaseDate;
  String? releaseName;
  String? newspaperNumber;
  String? recordNumber;
  String? officeName;
  String? statusIdentificationNumber;

  CardInfo(
      {this.cardType,
      this.nationalNumber,
      this.familyNumber,
      this.releaseDate,
      this.releaseName,
      this.newspaperNumber,
      this.recordNumber,
      this.officeName,
      this.statusIdentificationNumber});

  CardInfo.fromJson(Map<dynamic, dynamic> json) {
    cardType = json['card_type'];
    nationalNumber = json['national_number'];
    familyNumber = json['family_number'];
    releaseDate = json['releaseـdate'];
    releaseName = json['release_name'];
    newspaperNumber = json['newspaper_number'];
    recordNumber = json['record_number'];
    officeName = json['office_name'];
    statusIdentificationNumber = json['status_identification_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['card_type'] = this.cardType;
    data['national_number'] = this.nationalNumber;
    data['family_number'] = this.familyNumber;
    data['releaseـdate'] = this.releaseDate;
    data['release_name'] = this.releaseName;
    data['newspaper_number'] = this.newspaperNumber;
    data['record_number'] = this.recordNumber;
    data['office_name'] = this.officeName;
    data['status_identification_number'] = this.statusIdentificationNumber;
    return data;
  }
}

class ExtraDataModel {
  int? childNumber;
  String? marid;
  String? fatherDath;
  String? motherDath;
  String? hasbandDath;
  String? disMarid;
  String? childGet;

  ExtraDataModel(
      {this.childNumber,
      this.marid,
      this.fatherDath,
      this.motherDath,
      this.hasbandDath,
      this.disMarid,
      this.childGet});

  ExtraDataModel.fromJson(Map<dynamic, dynamic> json) {
    childNumber = json['child_number'];
    marid = json['marid'];
    fatherDath = json['father_dath'];
    motherDath = json['mother_dath'];
    hasbandDath = json['hasband_dath'];
    disMarid = json['dis_marid'];
    childGet = json['child_get'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['child_number'] = this.childNumber;
    data['marid'] = this.marid;
    data['father_dath'] = this.fatherDath;
    data['mother_dath'] = this.motherDath;
    data['hasband_dath'] = this.hasbandDath;
    data['dis_marid'] = this.disMarid;
    data['child_get'] = this.childGet;
    return data;
  }
}
