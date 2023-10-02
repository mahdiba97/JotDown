import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jot_down/domain/model/note.dart';
import 'package:jot_down/framework/presentation/note_detail/bloc/note_detail_bloc.dart';
import 'package:jot_down/framework/presentation/note_detail/bloc/note_detail_effect.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

class NoteDetailPage extends StatefulWidget {
  final Note? note;

  const NoteDetailPage({Key? key, this.note}) : super(key: key);

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _content = '';
  bool isInProgress = false;

  @override
  Widget build(BuildContext context) {
    return BlocSideEffectListener<NoteDetailBloc, NoteDetailEffect>(
      listener: (BuildContext context, NoteDetailEffect effect) {
        if (effect is ApplyDone) {
          isInProgress = false;
          Navigator.of(context).pop();
        }
        if (effect is ShowError) {
          isInProgress = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(effect.message),
          ));
        }
        if (effect is OnProgress) {
          isInProgress = true;
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.note?.title ?? 'New Note'),
            elevation: 2,
          ),
          body: isInProgress
              ? const Center(child: CircularProgressIndicator())
              : BlocBuilder<NoteDetailBloc, NoteDetailState>(
                  builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                        key: _formKey,
                        child: Column(children: [
                          TextFormField(
                              initialValue: widget.note?.title,
                              decoration:
                                  const InputDecoration(labelText: 'Title'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                              },
                              onSaved: (value) {
                                _title = value ?? '';
                              }),
                          TextFormField(
                              initialValue: widget.note?.content,
                              decoration:
                                  const InputDecoration(labelText: 'Content'),
                              onSaved: (value) {
                                _content = value ?? '';
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                              }),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: SizedBox(
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      final isValid =
                                          _formKey.currentState!.validate();
                                      if (isValid) {
                                        _formKey.currentState!.save();
                                        context
                                            .read<NoteDetailBloc>()
                                            .add(NoteDetailEvent.apply(
                                              id: widget.note?.id,
                                              title: _title,
                                              content: _content,
                                            ));
                                      }
                                    },
                                    child: const Text('Apply'),
                                  ),
                                ),
                              )),
                        ])),
                  );
                })),
    );
  }
}
