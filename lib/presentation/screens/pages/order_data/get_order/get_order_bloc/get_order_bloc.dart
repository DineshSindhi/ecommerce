import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../data/model/get_order_model.dart';
import '../../../../../../domain/api_data/api.dart';
import '../../../../../../domain/api_data/api_urls.dart';
import 'get_order_event.dart';
import 'get_order_state.dart';
class GetOrderBloc extends Bloc<GetOrEvent, GetOrderState> {
  ApiHelper apiHelper;
  GetOrderBloc({required this.apiHelper}) : super(GetOrderInitialState()) {
    on<GetOrderEvent>((event, emit) async {
      emit(GetOrderLoadingState());

      try{
        dynamic mData=await apiHelper.postApi(url: ApiUrl.GET_ORDER_URL,isHeader: true);
        var data = GetOrderModel.fromJson(mData);
        emit(GetOrderLoadedState(getOrder:data));
      }catch(e){
        emit(GetOrderErrorState(msg: e.toString()));
      }
    });
  }
}
