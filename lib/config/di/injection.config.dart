// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:jot_down/config/di/database_module.dart' as _i17;
import 'package:jot_down/config/di/use_case_module.dart' as _i18;
import 'package:jot_down/domain/data/local/datasource/note_datasource.dart'
    as _i8;
import 'package:jot_down/domain/data/repository/note_repository.dart' as _i9;
import 'package:jot_down/domain/model/mapper.dart' as _i3;
import 'package:jot_down/domain/model/note.dart' as _i4;
import 'package:jot_down/domain/usecase/note/add_note_use_case.dart' as _i11;
import 'package:jot_down/domain/usecase/note/delete_all_notes_use_case.dart'
    as _i12;
import 'package:jot_down/domain/usecase/note/delete_note_use_case.dart' as _i13;
import 'package:jot_down/domain/usecase/note/get_all_notes_use_case.dart'
    as _i14;
import 'package:jot_down/domain/usecase/note/update_note_use_case.dart' as _i10;
import 'package:jot_down/framework/data/local/database/note_dao.dart' as _i7;
import 'package:jot_down/framework/data/local/mapper/local_note_mapper.dart'
    as _i6;
import 'package:jot_down/framework/data/local/model/local_note.dart' as _i5;
import 'package:jot_down/framework/presentation/home/bloc/home_bloc.dart'
    as _i15;
import 'package:jot_down/framework/presentation/note_detail/bloc/note_detail_bloc.dart'
    as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final databaseModule = _$DatabaseModule();
    final useCaseModule = _$UseCaseModule();
    gh.factory<_i3.Mapper<_i4.Note, _i5.LocalNote>>(
        () => _i6.LocalNoteMapper());
    gh.singleton<_i7.NoteDao>(databaseModule.noteDao);
    gh.singleton<_i8.NoteDatasource>(databaseModule.provideNoteDatasource(
      gh<_i7.NoteDao>(),
      gh<_i3.Mapper<_i4.Note, _i5.LocalNote>>(),
    ));
    gh.singleton<_i9.NoteRepository>(
        databaseModule.provideNoteRepository(gh<_i8.NoteDatasource>()));
    gh.singleton<_i10.UpdateNoteUseCase>(
        useCaseModule.provideUpdateNoteUseCase(gh<_i9.NoteRepository>()));
    gh.singleton<_i11.AddNoteUseCase>(
        useCaseModule.provideAddNoteUseCase(gh<_i9.NoteRepository>()));
    gh.singleton<_i12.DeleteAllNotesUseCase>(
        useCaseModule.provideDeleteAllNotesUseCase(gh<_i9.NoteRepository>()));
    gh.singleton<_i13.DeleteNoteUseCase>(
        useCaseModule.provideDeleteNoteUseCase(gh<_i9.NoteRepository>()));
    gh.singleton<_i14.GetAllNotesUseCase>(
        useCaseModule.provideGetAllNotesUseCase(gh<_i9.NoteRepository>()));
    gh.factory<_i15.HomeBloc>(() => _i15.HomeBloc(
          getAllNotesUseCase: gh<_i14.GetAllNotesUseCase>(),
          deleteAllNotesUseCase: gh<_i12.DeleteAllNotesUseCase>(),
          deleteNoteUseCase: gh<_i13.DeleteNoteUseCase>(),
        ));
    gh.factory<_i16.NoteDetailBloc>(() => _i16.NoteDetailBloc(
          updateNoteUseCase: gh<_i10.UpdateNoteUseCase>(),
          addNoteUseCase: gh<_i11.AddNoteUseCase>(),
        ));
    return this;
  }
}

class _$DatabaseModule extends _i17.DatabaseModule {}

class _$UseCaseModule extends _i18.UseCaseModule {}
