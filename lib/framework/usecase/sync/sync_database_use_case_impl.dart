import 'package:jot_down/config/log/custom_printer.dart';
import 'package:jot_down/domain/data/repository/local_note_repository.dart';
import 'package:jot_down/domain/data/repository/remote_note_repository.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/domain/usecase/sync/sync_database_use_case.dart';
import 'package:jot_down/framework/data/remote/model/failure.dart';
import 'package:jot_down/framework/data/remote/model/success.dart';
import 'package:logger/logger.dart';

class SyncDatabaseUseCaseImpl extends SyncDatabaseUseCase {
  final RemoteNoteRepository _remoteRepository;
  final LocalNoteRepository _localRepository;
  var logger = Logger(printer: CustomPrinter());

  SyncDatabaseUseCaseImpl(
      {required RemoteNoteRepository remoteRepository,
      required LocalNoteRepository localRepository})
      : _localRepository = localRepository,
        _remoteRepository = remoteRepository;

  @override
  Future<String> call() async {
    var notSyncedNotes = await _localRepository.getNotes().then((value) =>
        value.where((element) => element.isSynced == false).toList());
    logger.i('Loading note synced notes: ${notSyncedNotes.length}');
    if (notSyncedNotes.isNotEmpty) {
      for (var element in notSyncedNotes) {
        if (element.isDeleted) {
          var result = await _remoteRepository.deleteNote(element.id);
          if (result is Success) {
            await _localRepository.deleteNote(element);
            logger
                .i('Remove deleted note from server and local: ${element.id}');
          }
        } else {
          var result = await _remoteRepository.updateNote(element);
          if (result is Success) {
            await _localRepository.updateNote(element.copyWith(isSynced: true));
            logger
                .i('Insert and update note in server and local: ${element.id}');
          } else {
            return (result as Failure).error.toString();
          }
        }
      }
    }
    try {
      var result = await _remoteRepository.getNotes();
      if (result is Success) {
        for (var element in (result as Success<List<Note>>).data) {
          _localRepository.addNote(element);
        }
        // await localRepository.addNotes((result as Success<List<Note>>).data);
        return "Sync was successful";
      } else {
        return (result as Failure).error.toString();
      }
    } catch (e) {
      return "Sync was successful! Database is empty";
    }
  }
}
