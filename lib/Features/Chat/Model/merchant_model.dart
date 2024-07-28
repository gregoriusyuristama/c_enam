class RespMerchants {
  bool? status;
  String? message;
  List<Data>? data;

  RespMerchants({this.status, this.message, this.data});

  RespMerchants.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? location;
  double? latitude;
  double? longitude;
  String? rating;
  int? isSellingHalalProducts;
  Null? createdAt;
  Null? updatedAt;
  List<Foods>? foods;

  Data(
      {this.id,
      this.name,
      this.location,
      this.latitude,
      this.longitude,
      this.rating,
      this.isSellingHalalProducts,
      this.createdAt,
      this.updatedAt,
      this.foods});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    rating = json['rating'];
    isSellingHalalProducts = json['isSellingHalalProducts'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) {
        foods!.add(new Foods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['rating'] = this.rating;
    data['isSellingHalalProducts'] = this.isSellingHalalProducts;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.foods != null) {
      data['foods'] = this.foods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Foods {
  int? id;
  String? name;
  String? imageSrc;
  String? price;
  String? discountedPrice;
  int? merchantId;
  String? description;
  String? cuisine;
  Null? createdAt;
  Null? updatedAt;

  Foods(
      {this.id,
      this.name,
      this.imageSrc,
      this.price,
      this.discountedPrice,
      this.merchantId,
      this.description,
      this.cuisine,
      this.createdAt,
      this.updatedAt});

  Foods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageSrc = json['image_src'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    merchantId = json['merchant_id'];
    description = json['description'];
    cuisine = json['cuisine'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_src'] = this.imageSrc;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    data['merchant_id'] = this.merchantId;
    data['description'] = this.description;
    data['cuisine'] = this.cuisine;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
