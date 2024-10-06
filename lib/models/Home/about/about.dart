class AboutModel {
  int? id;
  String? country;
  String? countryAr;
  String? topic;
  String? topicAr;
  String? title;
  String? titleAr;
  String? img;
  String? description;
  String? descriptionAr;
  String? location;
  String? addedBy;
  String? editedBy;
  String? created;

  AboutModel({
    this.id,
    this.country,
    this.countryAr,
    this.topic,
    this.topicAr,
    this.title,
    this.titleAr,
    this.img,
    this.description,
    this.descriptionAr,
    this.location,
    this.addedBy,
    this.editedBy,
    this.created,
  });

  AboutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    countryAr = json['country_ar'];
    topic = json['topic'];
    topicAr = json['topic_ar'];
    title = json['title'];
    titleAr = json['title_ar'];
    img = json['img'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    location = json['location'];
    addedBy = json['added_by'];
    editedBy = json['edited_by'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country'] = country;
    data['country_ar'] = countryAr;
    data['topic'] = topic;
    data['topic_ar'] = topicAr;
    data['title'] = title;
    data['title_ar'] = titleAr;
    data['img'] = img;
    data['description'] = description;
    data['description_ar'] = descriptionAr;
    data['location'] = location;
    data['added_by'] = addedBy;
    data['edited_by'] = editedBy;
    data['created'] = created;
    return data;
  }
}
