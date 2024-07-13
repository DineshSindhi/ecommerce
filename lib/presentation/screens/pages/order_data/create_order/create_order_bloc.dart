import 'package:bloc/bloc.dart';
import 'create_order_event.dart';
import 'create_order_state.dart';
class CreateOrderBloc extends Bloc<CreateOrEvent, CreateOrderState> {
  CreateOrderBloc() : super(CreateOrderInitialState()) {
    on<CreateOrderEvent>((event, emit) {

    });
  }
}
