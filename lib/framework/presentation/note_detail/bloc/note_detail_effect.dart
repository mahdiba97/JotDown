import 'package:equatable/equatable.dart';

abstract class NoteDetailEffect extends Equatable {
  const NoteDetailEffect();

  const factory NoteDetailEffect.showError(String message) = ShowError;

  factory NoteDetailEffect.applyDone() = ApplyDone;

  factory NoteDetailEffect.onProgress() = OnProgress;
}

class ShowError extends NoteDetailEffect {
  final String message;

  const ShowError(this.message);

  @override
  List<Object> get props => [message];
}

class ApplyDone extends NoteDetailEffect {
  @override
  List<Object> get props => [];
}

class OnProgress extends NoteDetailEffect {
  @override
  List<Object> get props => [];
}
