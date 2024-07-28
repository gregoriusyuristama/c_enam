class ChatResultGeneration {
  List<FoodInformation>? foodInformation;
  String? response;

  ChatResultGeneration({this.foodInformation, this.response});

  ChatResultGeneration.fromJson(Map<String, dynamic> json) {
    if (json['food_information'] != null) {
      foodInformation = <FoodInformation>[];
      json['food_information'].forEach((v) {
        foodInformation!.add(new FoodInformation.fromJson(v));
      });
    }
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.foodInformation != null) {
      data['food_information'] =
          this.foodInformation!.map((v) => v.toJson()).toList();
    }
    data['response'] = this.response;
    return data;
  }
}

class FoodInformation {
  String? imageSrc;
  String? merchantName;
  String? name;
  String? price;

  FoodInformation({this.imageSrc, this.merchantName, this.name, this.price});

  FoodInformation.fromJson(Map<String, dynamic> json) {
    imageSrc = json['image_src'];
    merchantName = json['merchant_name'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_src'] = this.imageSrc;
    data['merchant_name'] = this.merchantName;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
