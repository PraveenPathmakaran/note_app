import 'package:flutter/material.dart';
import 'package:note_app/domain/notes/note_failure.dart';

class CriticalFailureDisplay extends StatelessWidget {
  const CriticalFailureDisplay({super.key, required this.failure});

  final NoteFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            '😱',
            style: TextStyle(fontSize: 100),
          ),
          Text(
            failure.maybeMap(
              insufficientPermission: (_) => 'Insufficient permissions',
              orElse: () => 'Unexpected error. \nPlease, contact support.',
            ),
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.mail),
                SizedBox(width: 4),
                Text('I NEED HELP'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
