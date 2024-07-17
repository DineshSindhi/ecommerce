import 'package:bloc/bloc.dart';
import '../../../../../../domain/api_data/api.dart';
import '../../../../../../domain/api_data/api_urls.dart';
import 'create_order_event.dart';
import 'create_order_state.dart';
class CreateOrderBloc extends Bloc<CreateOrEvent, CreateOrderState> {
  ApiHelper apiHelper;
  CreateOrderBloc({required this.apiHelper}) : super(CreateOrderInitialState()) {
    on<CreateOrderEvent>((event, emit) async {
      emit(CreateOrderLoadingState());

      try{
        var mData=await apiHelper.postApi(url: ApiUrl.CREATE_ORDER_URL,isHeader: true);
        if(mData['status']){
          emit(CreateOrderLoadedState());
        }else{
          emit(CreateOrderErrorState(msg: mData['message']));
        }
      }catch(e){
        emit(CreateOrderErrorState(msg: e.toString()));
      }
    });
  }
}
