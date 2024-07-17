
import 'package:ecommerce_app/data/model/get_order_model.dart';


abstract class GetOrderState {}

final class GetOrderInitialState extends GetOrderState {}
final class GetOrderLoadingState extends GetOrderState {}
final class GetOrderLoadedState extends GetOrderState {
  GetOrderModel getOrder;
  GetOrderLoadedState({required this.getOrder});
}
final class GetOrderErrorState extends GetOrderState {
  String msg;
  GetOrderErrorState({required this.msg});
}
