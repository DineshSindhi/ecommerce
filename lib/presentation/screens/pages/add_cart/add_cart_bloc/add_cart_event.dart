
abstract class AddCtEvent {}
class AddCartEvent extends AddCtEvent{
  int productId;
  int quantity;
  AddCartEvent({required this.productId,required this.quantity});

}
