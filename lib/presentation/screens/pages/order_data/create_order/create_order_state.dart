
abstract class CreateOrderState{}
class CreateOrderInitialState extends CreateOrderState {}
class CreateOrderLoadingState extends CreateOrderState {}
class CreateOrderLoadedState extends CreateOrderState {}
class CreateOrderErrorState extends CreateOrderState {
  String msg;
  CreateOrderErrorState({required this.msg});
}
