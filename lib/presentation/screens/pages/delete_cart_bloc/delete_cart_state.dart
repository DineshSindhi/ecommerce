abstract class DeleteCartState{}
 class DeleteCartInitialState extends DeleteCartState {}
 class DeleteCartLoadingState extends DeleteCartState {}
 class DeleteCartLoadedState extends DeleteCartState {}
 class DeleteCartErrorState extends DeleteCartState {
   String msg;
   DeleteCartErrorState({required this.msg});
 }
