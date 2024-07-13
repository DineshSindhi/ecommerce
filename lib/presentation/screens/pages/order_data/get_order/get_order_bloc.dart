import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_order_event.dart';
part 'get_order_state.dart';

class GetOrderBloc extends Bloc<GetOrderEvent, GetOrderState> {
  GetOrderBloc() : super(GetOrderInitial()) {
    on<GetOrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
