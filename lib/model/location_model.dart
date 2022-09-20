class LocationModel {
  int? isLocationCard;
  String? number;
  String? l1;
  String? l2;
  String? l3;
  String? description;
  String? image;
  String? cardfimage;
  String? cardbimage;

  int? city;
  int? province;
  String? locationOffice;
  String? serialNumber;

  LocationModel(
      {this.isLocationCard,
      this.number,
      this.l1,
      this.l2,
      this.l3,
      this.description,
      this.image,
      this.city,
      this.province,
      this.locationOffice,
      this.serialNumber,
      this.cardbimage,
      this.cardfimage});

  LocationModel.fromJson(Map<String, dynamic> json) {
    isLocationCard = json['is_location_card'];
    number = json['number'];
    l1 = json['l1'];
    l2 = json['l2'];
    l3 = json['l3'];
    cardfimage = json['cardfimage'];
    cardbimage = json['cardbimage'];
    description = json['description'];
    image = json['image'];
    city = json['city'];
    province = json['province'];
    locationOffice = json['text'];
    serialNumber = json['serail_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_location_card'] = this.isLocationCard;
    data['number'] = this.number;
    data['l1'] = this.l1;
    data['l2'] = this.l2;
    data['l3'] = this.l3;
    data['description'] = this.description;
    data['image'] = this.image;
    data['city'] = this.city;
    data['province'] = this.province;
    data['text'] = this.locationOffice;
    data['serail_number'] = serialNumber;
    data['cardfimage'] = cardfimage;
    data['cardbimage'] = cardbimage;
    return data;
  }
}
