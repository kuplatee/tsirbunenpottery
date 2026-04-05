import 'package:madmudmobile/app/blocs/bloc_status.dart';

class CollectionsEvent {}

class BlocStatusChanged extends CollectionsEvent {
  final BlocStatus status;
  BlocStatusChanged(this.status);
}

class FetchCollections extends CollectionsEvent {}
