import 'package:madmudmobile/core/types/bloc_status/bloc_status.dart';

class PiecesEvent {}

class BlocStatusChanged extends PiecesEvent {
  final BlocStatus status;
  BlocStatusChanged(this.status);
}

class FetchPieces extends PiecesEvent {}
