import 'package:equatable/equatable.dart';

abstract class HomeEffect extends Equatable {
  const HomeEffect();

  factory HomeEffect.gotoNoteDetails() = GotoNoteDetails;

  factory HomeEffect.deleteAllNotesDone() = DeleteAllNotesDone;

  factory HomeEffect.deleteNoteDone() = DeleteNoteDone;

  factory HomeEffect.finishLoading() = FinishLoading;
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
