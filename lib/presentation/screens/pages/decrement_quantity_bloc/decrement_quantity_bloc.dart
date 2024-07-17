
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/api_data/api.dart';
import '../../../../domain/api_data/api_urls.dart';
import 'decrement_quantity_event.dart';
import 'decrement_quantity_state.dart';

class DecrementQuantityBloc extends Bloc<DecrementQEvent, DecrementQuantityState> {
  ApiHelper apiHelper;
  DecrementQuantityBloc({required this.apiHelper}) : super(DecrementQuantityInitialState()) {
    on<DecrementQuantityEvent>((event, emit) async {

      emit(DecrementQuantityLoadingState());
      try{
      var mData=await apiHelper.postApi(url: ApiUrl.DECREMENT_QUANTITY_URL,mapData:{'product_id':event.productId,'quantity':event.quantity},isHeader: true);

      if(mData['status']){
        emit(DecrementQuantityLoadedState());
      }else{
        emit(DecrementQuantityErrorState(msg: mData['message']));
      }

      }catch(e){
      emit(DecrementQuantityErrorState(msg: e.toString()));
      }
    });
  }
}
