import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jot_down/config/route/app_routes.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/presentation/home/bloc/home_bloc.dart';
import 'package:jot_down/framework/presentation/home/bloc/home_effect.dart';
import 'package:jot_down/framework/presentation/home/bloc/home_event.dart';
import 'package:jot_down/framework/presentation/home/bloc/home_state.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeEvent.initialData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectListener<HomeBloc, HomeEffect>(
      listener: (BuildContext context, HomeEffect effect) {
        switch (effect.runtimeType) {
          case GotoNoteDetails:
            Navigator.of(context)
                .pushNamed(AppRoutes.noteDetails)
                .then((value) {
              isLoading = true;
              BlocProvider.of<HomeBloc>(context).add(HomeEvent.initialData());
            });
          case DeleteAllNotesDone:
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('All Notes Deleted'),
            ));
          case DeleteNoteDone:
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Note Deleted'),
              ),
            );
          case FinishLoading:
            setState(() {
              isLoading = false;
            });
          case SyncFinished:
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              (effect as SyncFinished).syncResult,
            )));
          case NetworkError:
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Network Error'),
            ));
          default:
            throw UnimplementedError('Unknown HomeEffect: $effect');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text("JotDown"),
          actions: [
            IconButton(
              onPressed: () {
                context.read<HomeBloc>().add(HomeEvent.deleteAllNotesClicked());
              },
              icon: const Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {
                context.read<HomeBloc>().add(HomeEvent.syncData());
              },
              icon: const Icon(Icons.sync),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<HomeBloc>().add(HomeEvent.addNoteClicked());
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                    if (state.notes.isEmpty) {
                      return Center(
                        child: Image.asset(
                          'assets/photos/ic_nothing_to_show.png',
                          width: 300,
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: state.notes.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                                key: ValueKey(state.notes[index]),
                                onDismissed: (_) =>
                                    BlocProvider.of<HomeBloc>(context).add(
                                      HomeEvent.swipeNoteToDelete(
                                          state.notes[index]),
                                    ),
                                child: NoteItemView(note: state.notes[index]));
                          });
                    }
                  })),
      ),
    );
  }
}

class NoteItemView extends StatefulWidget {
  final Note note;

  const NoteItemView({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteItemView> createState() => _NoteItemViewState();
}

class _NoteItemViewState extends State<NoteItemView> {
  final Color _color =
      HSVColor.fromAHSV(1.0, Random().nextInt(265).toDouble(), .2, 1.0)
          .toColor();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Card(
          color: _color,
          child: ListTile(
              title: Text(widget.note.title),
              subtitle: Text(widget.note.content),
              leading: const Icon(Icons.notes),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.noteDetails, arguments: widget.note)
                    .then((value) {
                  BlocProvider.of<HomeBloc>(context)
                      .add(HomeEvent.initialData());
                });
              })),
    );
  }
}
