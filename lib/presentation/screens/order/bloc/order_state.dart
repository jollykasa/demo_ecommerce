part of 'order_bloc.dart';

@immutable
sealed class OrderState {}

abstract class OrderActionState extends OrderState {}

final class OrderInitial extends OrderState {}

class OrderNativatedToHomeActionState extends OrderActionState {}
