

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/api_data/api.dart';
import '../../../../domain/api_data/api_urls.dart';
import 'delete_cart_event.dart';
import 'delete_cart_state.dart';

class DeleteCartBloc extends Bloc<DeleteCtEvent, DeleteCartState> {
  ApiHelper apiHelper;
  DeleteCartBloc({required this.apiHelper}) : super(DeleteCartInitialState()) {
    on<DeleteCartEvent>((event, emit) async {
      emit(DeleteCartLoadingState());
      try{
        var mData=await apiHelper.postApi(url: ApiUrl.DELETE_CART_URL,isHeader: true);
        print(mData);
        if(mData['status']){
          emit(DeleteCartLoadedState());
        }else{
          emit(DeleteCartErrorState(msg: mData['message']));
        }

      }catch(e){
        emit(DeleteCartErrorState(msg: e.toString()));
      }
    });
  }
}
