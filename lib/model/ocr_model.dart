class OcrModel {
  String? uid;
  String? text;
  Metadata? metadata;
  Limits? limits;
  int? status;

  OcrModel({this.uid, this.text, this.metadata, this.limits, this.status});

  OcrModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    text = json['text'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    limits =
        json['limits'] != null ? new Limits.fromJson(json['limits']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['text'] = this.text;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.limits != null) {
      data['limits'] = this.limits!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Metadata {
  String? md5;
  String? filename;
  String? createdAt;
  int? conversionTime;
  int? fileSizeBytes;
  int? db;

  Metadata(
      {this.md5,
      this.filename,
      this.createdAt,
      this.conversionTime,
      this.fileSizeBytes,
      this.db});

  Metadata.fromJson(Map<String, dynamic> json) {
    md5 = json['md5'];
    filename = json['filename'];
    createdAt = json['created_at'];
    conversionTime = json['conversion_time'];
    fileSizeBytes = json['file_size_bytes'];
    db = json['db'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['md5'] = this.md5;
    data['filename'] = this.filename;
    data['created_at'] = this.createdAt;
    data['conversion_time'] = this.conversionTime;
    data['file_size_bytes'] = this.fileSizeBytes;
    data['db'] = this.db;
    return data;
  }
}

class Limits {
  int? maxChecksPerHour;
  int? checksLastHour;
  bool? tempBlocked;

  Limits({this.maxChecksPerHour, this.checksLastHour, this.tempBlocked});

  Limits.fromJson(Map<String, dynamic> json) {
    maxChecksPerHour = json['max_checks_per_hour'];
    checksLastHour = json['checks_last_hour'];
    tempBlocked = json['temp_blocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max_checks_per_hour'] = this.maxChecksPerHour;
    data['checks_last_hour'] = this.checksLastHour;
    data['temp_blocked'] = this.tempBlocked;
    return data;
  }
}
