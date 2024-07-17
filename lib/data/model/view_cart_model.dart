

class ViewCartModel {
  int? id;
  int? productId;
  String? name;
  String? price;
  int? quantity;
  String? image;

  ViewCartModel(
      {required this.id,
        required this.productId,
        required  this.name,
        required this.price,
        required  this.quantity,
        required  this.image});

 factory ViewCartModel.fromJson(Map<String, dynamic> json) {
    return ViewCartModel(
        id: json['id'],
        productId: json['product_id'],
        name: json['name'],
        price: json['price'],
        quantity: json['quantity'],
        image: json['image']
    );
 }

}