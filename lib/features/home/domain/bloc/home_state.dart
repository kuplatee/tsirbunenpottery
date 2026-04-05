import 'package:equatable/equatable.dart';
import 'package:madmudmobile/core/types/bloc_status/bloc_status.dart';

class HomeState extends Equatable {
  final BlocStatus status;
  final String? homePageImageFileName;

  const HomeState({
    this.status = const BlocStatus(Status.ok),
    this.homePageImageFileName,
  });

  HomeState copyWith({
    BlocStatus? newStatus,
    String? newHomePageImageFileName,
  }) {
    return HomeState(
      status: newStatus ?? status,
      homePageImageFileName: newHomePageImageFileName ?? homePageImageFileName,
    );
  }

  @override
  List<Object?> get props => [status, homePageImageFileName];
}
