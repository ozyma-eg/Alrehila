class BeachesModel {
  String? country;
  String? countryAr;
  String? governorate;
  String? governorateAr;
  int? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? img;
  String? location;
  String? average;
  String? type;
  String? favoriteType;
  int? favorite;

  BeachesModel(
      {this.country,
      this.countryAr,
      this.governorate,
      this.governorateAr,
      this.id,
      this.name,
      this.nameAr,
      this.description,
      this.descriptionAr,
      this.img,
      this.location,
      this.average,
      this.type,
      this.favoriteType,
      this.favorite});

  BeachesModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    countryAr = json['country_ar'];
    governorate = json['governorate'];
    governorateAr = json['governorate_ar'];
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    img = json['img'];
    location = json['location'];
    average = json['average'];
    type = json['type'];
    favoriteType = json['favorite_type'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['country_ar'] = countryAr;
    data['governorate'] = governorate;
    data['governorate_ar'] = governorateAr;
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['description'] = description;
    data['description_ar'] = descriptionAr;
    data['img'] = img;
    data['location'] = location;
    data['average'] = average;
    data['type'] = type;
    data['favorite_type'] = favoriteType;
    data['favorite'] = favorite;
    return data;
  }
}
