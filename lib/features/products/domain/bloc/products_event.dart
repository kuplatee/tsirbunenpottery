import 'package:madmudmobile/app/blocs/bloc_status.dart';

class ProductsEvent {}

class BlocStatusChanged extends ProductsEvent {
  final BlocStatus status;

  BlocStatusChanged(this.status);
}

class FetchProducts extends ProductsEvent {
  FetchProducts();
}
