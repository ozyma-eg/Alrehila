class CountryModel {
  int? id;
  String? name;
  String? nameAr;
  String? img;
  String? flag;
  int? supported;
  int? about;
  String? aboutImg;
  int? events;
  String? eventsImg;
  int? store;
  String? storeImg;
  String? addedBy;
  String? editedBy;
  String? created;

  CountryModel({
    this.id,
    this.name,
    this.nameAr,
    this.img,
    this.flag,
    this.supported,
    this.about,
    this.aboutImg,
    this.events,
    this.eventsImg,
    this.store,
    this.storeImg,
    this.addedBy,
    this.editedBy,
    this.created,
  });

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    img = json['img'];
    flag = json['flag'];
    supported = json['supported'];
    about = json['about'];
    aboutImg = json['about_img'];
    events = json['events'];
    eventsImg = json['events_img'];
    store = json['store'];
    storeImg = json['store_img'];
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
    data['flag'] = flag;
    data['supported'] = supported;
    data['about'] = about;
    data['about_img'] = aboutImg;
    data['events'] = events;
    data['events_img'] = eventsImg;
    data['store'] = store;
    data['store_img'] = storeImg;
    data['added_by'] = addedBy;
    data['edited_by'] = editedBy;
    data['created'] = created;
    return data;
  }
}

class GovernoratesModel {
  int? id;
  String? name;
  String? nameAr;
  String? country;
  String? countryAr;
  String? img;
  int? supported;
  int? beaches;
  int? hotels;
  int? places;
  int? restaurants;
  String? addedBy;
  String? editedBy;
  String? created;

  GovernoratesModel(
      {this.id,
      this.name,
      this.nameAr,
      this.country,
      this.countryAr,
      this.img,
      this.supported,
      this.beaches,
      this.hotels,
      this.places,
      this.restaurants,
      this.addedBy,
      this.editedBy,
      this.created});

  GovernoratesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    country = json['country'];
    countryAr = json['country_ar'];
    img = json['img'];
    supported = json['supported'];
    beaches = json['beaches'];
    hotels = json['hotels'];
    places = json['places'];
    restaurants = json['restaurants'];
    addedBy = json['added_by'];
    editedBy = json['edited_by'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['country'] = country;
    data['country_ar'] = countryAr;
    data['img'] = img;
    data['supported'] = supported;
    data['beaches'] = beaches;
    data['hotels'] = hotels;
    data['places'] = places;
    data['restaurants'] = restaurants;
    data['added_by'] = addedBy;
    data['edited_by'] = editedBy;
    data['created'] = created;
    return data;
  }
}
