// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    NoteFormRoute.name: (routeData) {
      final args = routeData.argsAs<NoteFormRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NoteFormPage(
          key: args.key,
          editNote: args.editNote,
        ),
      );
    },
    NotesOverViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotesOverViewPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [NoteFormPage]
class NoteFormRoute extends PageRouteInfo<NoteFormRouteArgs> {
  NoteFormRoute({
    Key? key,
    required Note? editNote,
    List<PageRouteInfo>? children,
  }) : super(
          NoteFormRoute.name,
          args: NoteFormRouteArgs(
            key: key,
            editNote: editNote,
          ),
          initialChildren: children,
        );

  static const String name = 'NoteFormRoute';

  static const PageInfo<NoteFormRouteArgs> page =
      PageInfo<NoteFormRouteArgs>(name);
}

class NoteFormRouteArgs {
  const NoteFormRouteArgs({
    this.key,
    required this.editNote,
  });

  final Key? key;

  final Note? editNote;

  @override
  String toString() {
    return 'NoteFormRouteArgs{key: $key, editNote: $editNote}';
  }
}

/// generated route for
/// [NotesOverViewPage]
class NotesOverViewRoute extends PageRouteInfo<void> {
  const NotesOverViewRoute({List<PageRouteInfo>? children})
      : super(
          NotesOverViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesOverViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
