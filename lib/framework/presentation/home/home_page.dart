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
    BlocProvider.of<HomeBloc>(context).add(HomeEvent.loadNotes());
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
              BlocProvider.of<HomeBloc>(context).add(HomeEvent.loadNotes());
            });
            break;
          case DeleteAllNotesDone:
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('All Notes Deleted'),
            ));
            break;
          case DeleteNoteDone:
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Note Deleted'),
              ),
            );
            break;
          case FinishLoading:
            setState(() {
              isLoading = false;
            });
            break;
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
            )
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

class NoteItemView extends StatelessWidget {
  final Note note;

  const NoteItemView({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Card(
          child: ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
              leading: const Icon(Icons.notes),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.noteDetails, arguments: note)
                    .then((value) {
                  BlocProvider.of<HomeBloc>(context).add(HomeEvent.loadNotes());
                });
              })),
    );
  }
}
