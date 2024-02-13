

const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';

class Pizza {
  int id;
  String pizzaName;
  String description;
  double price;
  String imageUrl;

  Pizza.fromJson(Map<String, dynamic> json, this.id, this.pizzaName,
      this.description, this.price, this.imageUrl) {
    id = int.tryParse(json['id'].toString()) ?? 0;
    pizzaName =
        json['pizzaName'] != null ? json['pizzaName'].toString() : 'No name';
    description =
        (json['description'] != null) ? json['description'].toString() : '';
    price = double.tryParse(json['price'].toString()) ?? 0;
    imageUrl = json['imageUrl'] ?? '';
  }

  Map<String, dynamic> toJson() {
 return {
 keyId: id,
 keyName: pizzaName,
 keyDescription: description,
 keyPrice: price,
 keyImage: imageUrl, };
}

}
