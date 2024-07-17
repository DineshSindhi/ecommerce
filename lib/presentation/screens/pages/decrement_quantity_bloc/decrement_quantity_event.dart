abstract class DecrementQEvent {}
class DecrementQuantityEvent extends DecrementQEvent{
  int productId;
  int quantity;
  DecrementQuantityEvent({required this.productId,required this.quantity});
}
