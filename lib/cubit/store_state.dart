part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}


class StoreUpdateProductLoading extends StoreState {}

class StoreUpdateProductSuccess extends StoreState {}

class StoreUpdateProductFailure extends StoreState {}

