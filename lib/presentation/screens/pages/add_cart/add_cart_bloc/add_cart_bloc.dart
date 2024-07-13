
import 'package:ecommerce_app/domain/api_data/api_urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/api_data/api.dart';
import 'add_cart_event.dart';
import 'add_cart_state.dart';

class AddCartBloc extends Bloc<AddCartEvent, AddCartState> {
  ApiHelper apiHelper;
  AddCartBloc({required this.apiHelper}) : super(AddCartInitialState()) {
    on<AddCartEvent>((event, emit) async {
      emit(AddCartLoadingState());

      try{
        var mData=await apiHelper.postApi(url: ApiUrl.ADD_TO_cart_URL,isHeader: true,mapData: {
          "product_id":event.productId,
          "quantity":event.quantity
        });
        if(mData['status']=='true'){
          emit(AddCartLoadedState());
        }else{
          emit(AddCartErrorState(msg: mData['message']));
        }
      }catch(e){
        emit(AddCartErrorState(msg: e.toString()));
      }

    });
  }
}
