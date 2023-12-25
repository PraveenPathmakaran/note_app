import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/notes/note.dart';
import '../notes/note_form/note_form_page.dart';
import '../notes/notes_overview/notes_overview_page.dart';
import '../sign_in/sign_in_page.dart';
import '../splash/splash_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: NotesOverViewRoute.page,
        ),
        AutoRoute(page: NoteFormRoute.page, fullscreenDialog: true),
      ];
}
