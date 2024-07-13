abstract class AddCartState {}
 class AddCartInitialState extends AddCartState {}
 class AddCartLoadingState extends AddCartState {}
 class AddCartLoadedState extends AddCartState {}
 class AddCartErrorState extends AddCartState {
  String msg;
  AddCartErrorState({required this.msg});
 }
