import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderHomeButtonNavigateEvent>(orderHomeButtonNavigateEvent);
  }

  FutureOr<void> orderHomeButtonNavigateEvent(
      OrderHomeButtonNavigateEvent event, Emitter<OrderState> emit) {
    print("Confirm button click");
    emit(OrderNativatedToHomeActionState());
  }
}
