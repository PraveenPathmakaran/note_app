import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/domain/auth/i_auth_facade.dart';
import 'package:note_app/injection.dart';

import '../../domain/core/errors.dart';

extension FireStoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError);

    return FirebaseFirestore.instance
        .collection('users')
        .doc(user?.userId.getOrCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');
}
