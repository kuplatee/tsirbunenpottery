import 'package:madmudmobile/app/blocs/bloc_status.dart';

class CategoriesEvent {}

class BlocStatusChanged extends CategoriesEvent {
  final BlocStatus status;
  BlocStatusChanged(this.status);
}

class FetchCategories extends CategoriesEvent {}
