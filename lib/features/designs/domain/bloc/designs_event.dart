import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';

class DesignsEvent {}

class BlocStatusChanged extends DesignsEvent {
  final BlocStatus status;
  BlocStatusChanged(this.status);
}

class FetchDesigns extends DesignsEvent {}
