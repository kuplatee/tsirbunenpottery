import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';

class CategoriesEvent {}

class BlocStatusChanged extends CategoriesEvent {
  final BlocStatus status;
  BlocStatusChanged(this.status);
}

class FetchCategories extends CategoriesEvent {}
