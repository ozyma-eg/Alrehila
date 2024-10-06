class StoreModel {
  int? id;
  String? name;
  String? nameAr;
  String? img;
  String? description;
  String? descriptionAr;
  String? country;
  String? countryAr;
  String? governorate;
  String? governorateAr;
  int? average;
  String? location;
  String? addedBy;
  String? editedBy;
  String? created;

  StoreModel({
    this.id,
    this.name,
    this.nameAr,
    this.img,
    this.description,
    this.descriptionAr,
    this.country,
    this.countryAr,
    this.governorate,
    this.governorateAr,
    this.average,
    this.location,
    this.addedBy,
    this.editedBy,
    this.created,
  });

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    img = json['img'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    country = json['country'];
    countryAr = json['country_ar'];
    governorate = json['governorate'];
    governorateAr = json['governorate_ar'];
    average = json['average'];
    location = json['location'];
    addedBy = json['added_by'];
    editedBy = json['edited_by'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['img'] = img;
    data['description'] = description;
    data['description_ar'] = descriptionAr;
    data['country'] = country;
    data['country_ar'] = countryAr;
    data['governorate'] = governorate;
    data['governorate_ar'] = governorateAr;
    data['average'] = average;
    data['location'] = location;
    data['added_by'] = addedBy;
    data['edited_by'] = editedBy;
    data['created'] = created;
    return data;
  }
}
