import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/application/auth/auth_bloc.dart';
import 'package:note_app/application/note/note_watcher/note_watcher_bloc.dart';
import 'package:note_app/injection.dart';
import 'package:note_app/presentation/notes/notes_overview/widgets/note_overview_body_widget.dart';
import 'package:note_app/presentation/notes/notes_overview/widgets/uncompleted_switch.dart';

import '../../../application/note/note_actor/note_actor_bloc.dart';
import '../../routes/router.dart';

@RoutePage()
class NotesOverViewPage extends StatelessWidget {
  const NotesOverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
            create: (context) => getIt.call<NoteWatcherBloc>()
              ..add(const NoteWatcherEvent.watchAllStarted())),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                authenticated: (_) => context.router.push(const SignInRoute()),
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
              listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              deleteFailure: (value) {
                Flushbar(
                    message: value.noteFailure.map(
                        unexpected: (_) =>
                            'Unexpected error occured while deleting, please contact support.',
                        insufficientPermission: (_) =>
                            'Insufficient permissions ❌',
                        unableToUpdate: (_) =>
                            'Impossible error')).show(context);
              },
            );
          })
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            leading: IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthEvent.signedOut());
                },
                icon: const Icon(Icons.exit_to_app)),
            actions: const <Widget>[UnCompletedSwitch()],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //Todo navigate to noteform page
            },
            child: const Icon(Icons.add),
          ),
          body: const NoteOverViewBody(),
        ),
      ),
    );
  }
}
