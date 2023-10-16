import 'package:equatable/equatable.dart';

abstract class HomeEffect extends Equatable {
  const HomeEffect();

  factory HomeEffect.gotoNoteDetails() = GotoNoteDetails;

  factory HomeEffect.deleteAllNotesDone() = DeleteAllNotesDone;

  factory HomeEffect.deleteNoteDone() = DeleteNoteDone;

  factory HomeEffect.finishLoading() = FinishLoading;

  const factory HomeEffect.syncFinished(String syncResult) = SyncFinished;

  const factory HomeEffect.networkError(String message) = NetworkError;
}

class GotoNoteDetails extends HomeEffect {
  @override
  List<Object> get props => [];
}

class DeleteAllNotesDone extends HomeEffect {
  @override
  List<Object> get props => [];
}

class DeleteNoteDone extends HomeEffect {
  @override
  List<Object> get props => [];
}

class FinishLoading extends HomeEffect {
  @override
  List<Object> get props => [];
}

class SyncFinished extends HomeEffect {
  final String syncResult;

  const SyncFinished(this.syncResult);

  @override
  List<Object> get props => [syncResult];
}

class NetworkError extends HomeEffect {
  final String message;

  const NetworkError(this.message);

  @override
  List<Object> get props => [message];
}
