// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jot_down/config/di/database_module.dart' as _i26;
import 'package:jot_down/config/di/datasource_module.dart' as _i27;
import 'package:jot_down/config/di/repository_module.dart' as _i28;
import 'package:jot_down/config/di/use_case_module.dart' as _i29;
import 'package:jot_down/config/di/web_service_module.dart' as _i25;
import 'package:jot_down/domain/data/local/datasource/note_datasource.dart'
    as _i12;
import 'package:jot_down/domain/data/remote/datasource/note_remote_datasource.dart'
    as _i13;
import 'package:jot_down/domain/data/repository/local_note_repository.dart'
    as _i16;
import 'package:jot_down/domain/data/repository/remote_note_repository.dart'
    as _i14;
import 'package:jot_down/domain/model/mapper.dart' as _i4;
import 'package:jot_down/domain/model/note.dart' as _i5;
import 'package:jot_down/domain/usecase/note/add_note_use_case.dart' as _i19;
import 'package:jot_down/domain/usecase/note/delete_all_notes_use_case.dart'
    as _i20;
import 'package:jot_down/domain/usecase/note/delete_note_use_case.dart' as _i21;
import 'package:jot_down/domain/usecase/note/get_all_notes_use_case.dart'
    as _i22;
import 'package:jot_down/domain/usecase/note/update_note_use_case.dart' as _i18;
import 'package:jot_down/domain/usecase/sync/get_notes_from_api_use_case.dart'
    as _i15;
import 'package:jot_down/domain/usecase/sync/sync_database_use_case.dart'
    as _i17;
import 'package:jot_down/framework/data/local/database/note_dao.dart' as _i11;
import 'package:jot_down/framework/data/local/mapper/local_note_mapper.dart'
    as _i7;
import 'package:jot_down/framework/data/local/model/local_note.dart' as _i6;
import 'package:jot_down/framework/data/remote/dio/note_api.dart' as _i10;
import 'package:jot_down/framework/data/remote/mapper/remote_note_mapper.dart'
    as _i9;
import 'package:jot_down/framework/data/remote/model/remote_note.dart' as _i8;
import 'package:jot_down/framework/presentation/home/bloc/home_bloc.dart'
    as _i23;
import 'package:jot_down/framework/presentation/note_detail/bloc/note_detail_bloc.dart'
    as _i24;

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
    final webServiceModule = _$WebServiceModule();
    final databaseModule = _$DatabaseModule();
    final datasourceModule = _$DatasourceModule();
    final repositoryModule = _$RepositoryModule();
    final useCaseModule = _$UseCaseModule();
    gh.singleton<_i3.Dio>(webServiceModule.dio);
    gh.factory<_i4.Mapper<_i5.Note, _i6.LocalNote>>(
        () => _i7.LocalNoteMapper());
    gh.factory<_i4.Mapper<_i5.Note, _i8.RemoteNote>>(
        () => _i9.RemoteNoteMapper());
    gh.singleton<_i10.NoteApi>(webServiceModule.provideNoteApi(gh<_i3.Dio>()));
    gh.singleton<_i11.NoteDao>(databaseModule.noteDao);
    gh.singleton<_i12.NoteDatasource>(
        datasourceModule.provideLocalNoteDatasource(
      gh<_i11.NoteDao>(),
      gh<_i4.Mapper<_i5.Note, _i6.LocalNote>>(),
    ));
    gh.singleton<_i13.NoteRemoteDatasource>(
        datasourceModule.provideRemoteNoteDatasource(
      gh<_i10.NoteApi>(),
      gh<_i4.Mapper<_i5.Note, _i8.RemoteNote>>(),
    ));
    gh.singleton<_i14.RemoteNoteRepository>(repositoryModule
        .provideRemoteNoteRepository(gh<_i13.NoteRemoteDatasource>()));
    gh.singleton<_i15.GetNotesFromApiUseCase>(useCaseModule
        .provideGetNotesFromApiUseCase(gh<_i14.RemoteNoteRepository>()));
    gh.singleton<_i16.LocalNoteRepository>(
        repositoryModule.provideLocalNoteRepository(gh<_i12.NoteDatasource>()));
    gh.singleton<_i17.SyncDatabaseUseCase>(
        useCaseModule.provideSyncDatabaseUseCase(
      gh<_i16.LocalNoteRepository>(),
      gh<_i14.RemoteNoteRepository>(),
    ));
    gh.singleton<_i18.UpdateNoteUseCase>(
        useCaseModule.provideUpdateNoteUseCase(gh<_i16.LocalNoteRepository>()));
    gh.singleton<_i19.AddNoteUseCase>(
        useCaseModule.provideAddNoteUseCase(gh<_i16.LocalNoteRepository>()));
    gh.singleton<_i20.DeleteAllNotesUseCase>(useCaseModule
        .provideDeleteAllNotesUseCase(gh<_i16.LocalNoteRepository>()));
    gh.singleton<_i21.DeleteNoteUseCase>(
        useCaseModule.provideDeleteNoteUseCase(gh<_i16.LocalNoteRepository>()));
    gh.singleton<_i22.GetAllNotesUseCase>(useCaseModule
        .provideGetAllNotesUseCase(gh<_i16.LocalNoteRepository>()));
    gh.factory<_i23.HomeBloc>(() => _i23.HomeBloc(
          getAllNotesUseCase: gh<_i22.GetAllNotesUseCase>(),
          deleteAllNotesUseCase: gh<_i20.DeleteAllNotesUseCase>(),
          deleteNoteUseCase: gh<_i21.DeleteNoteUseCase>(),
          syncDatabaseUseCase: gh<_i17.SyncDatabaseUseCase>(),
          getNotesFromApiUseCase: gh<_i15.GetNotesFromApiUseCase>(),
          updateNoteUseCase: gh<_i18.UpdateNoteUseCase>(),
        ));
    gh.factory<_i24.NoteDetailBloc>(() => _i24.NoteDetailBloc(
          updateNoteUseCase: gh<_i18.UpdateNoteUseCase>(),
          addNoteUseCase: gh<_i19.AddNoteUseCase>(),
        ));
    return this;
  }
}

class _$WebServiceModule extends _i25.WebServiceModule {}

class _$DatabaseModule extends _i26.DatabaseModule {}

class _$DatasourceModule extends _i27.DatasourceModule {}

class _$RepositoryModule extends _i28.RepositoryModule {}

class _$UseCaseModule extends _i29.UseCaseModule {}
