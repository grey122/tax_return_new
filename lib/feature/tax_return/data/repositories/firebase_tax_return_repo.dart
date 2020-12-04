import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_return/feature/tax_return/data/model/tax_return_model_built.dart';
import 'package:tax_return/feature/tax_return/domain/entities/entities_export.dart';
import 'package:tax_return/feature/tax_return/domain/repositories/repositories_export.dart';

class FirebaseTaxReturnRepository implements TaxReturnRepository {
  final FirebaseFirestore firebaseFirestore;
  final User user;
  static const String path = 'tax_return';

  //final taxReturnCollection = FirebaseFirestore.instance.collection(path);

  FirebaseTaxReturnRepository(this.firebaseFirestore, this.user);

  @override
  Future<void> addNewTaxReturn(TaxReturnBuilt taxReturn) {
    return firebaseFirestore
        .collection(path)
        .doc(user.id)
        .collection('User')
        .add(taxReturn.toModel().toDocument());
  }

  @override
  Future<void> deleteTaxReturn(TaxReturnBuilt taxReturn) {
    return firebaseFirestore
        .collection(path)
        .doc(user.id)
        .collection('User')
        .doc(taxReturn.id)
        .delete();
  }

  @override
  Stream<List<TaxReturnBuilt>> taxReturns() {
    print('user id is ${user.id}');
    return firebaseFirestore
        .collection(path)
        .doc(user.id)
        .collection('User')
        .get()
        .asStream()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) =>
              TaxReturnBuilt.fromModel(TaxReturnModelBuilt.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateTaxReturn(TaxReturnBuilt update) {
    return firebaseFirestore
        .collection(path)
        .doc(user.id)
        .collection('User')
        .doc(update.id)
        .update(update.toModel().toDocument());
  }
}
