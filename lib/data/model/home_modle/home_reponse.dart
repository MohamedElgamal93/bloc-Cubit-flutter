class HomeResponse {
  List<Data>? data;

  HomeResponse({this.data});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? thumbAlt;
  String? thumb;
  int? startPrice;
  int? days;
  int? destinationId;
  String? destinationSlug;

  Data(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.thumbAlt,
      this.thumb,
      this.startPrice,
      this.days,
      this.destinationId,
      this.destinationSlug});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    thumbAlt = json['thumb_alt'];
    thumb = json['thumb'];
    startPrice = json['start_price'];
    days = json['days'];
    destinationId = json['destination__id'];
    destinationSlug = json['destination_slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['thumb_alt'] = this.thumbAlt;
    data['thumb'] = this.thumb;
    data['start_price'] = this.startPrice;
    data['days'] = this.days;
    data['destination__id'] = this.destinationId;
    data['destination_slug'] = this.destinationSlug;
    return data;
  }
}
