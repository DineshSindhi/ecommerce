abstract class DecrementQuantityState {}

final class DecrementQuantityInitialState extends DecrementQuantityState {}
final class DecrementQuantityLoadingState extends DecrementQuantityState {}
final class DecrementQuantityLoadedState extends DecrementQuantityState {}
final class DecrementQuantityErrorState extends DecrementQuantityState {
  String msg;
  DecrementQuantityErrorState({required this.msg});
}
