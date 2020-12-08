import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_return/feature/tax_return/data/model/tax_return_model_built.dart';
import 'package:tax_return/feature/tax_return/domain/entities/entities_export.dart';
import 'package:tax_return/feature/tax_return/domain/repositories/repositories_export.dart';

class FirebaseTaxReturnRepository implements TaxReturnRepository {
  FirebaseTaxReturnRepository(this.firebaseFirestore, this.user);

  final FirebaseFirestore firebaseFirestore;
  final User user;
  static const String PATH = 'tax_return';
  static const String TAX_PATH = 'tax_return_data';

  // final taxReturnCollection = FirebaseFirestore.instance.collection(path);
  CollectionReference get taxReturnCollection =>
      firebaseFirestore.collection(PATH).doc(user.id).collection(TAX_PATH);

  @override
  Future<void> addNewTaxReturn(TaxReturnBuilt taxReturn) {
    return taxReturnCollection.add(taxReturn.toModel().toDocument());
  }

  @override
  Future<void> deleteTaxReturn(TaxReturnBuilt taxReturn) {
    return taxReturnCollection.doc(taxReturn.id).delete();
  }

//TODO: try the get() instead of snapshot()
  @override
  Stream<List<TaxReturnBuilt>> taxReturns() {
    print('user id is ${user.id}');
    return taxReturnCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) =>
              TaxReturnBuilt.fromModel(TaxReturnModelBuilt.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateTaxReturn(TaxReturnBuilt update) {
    return taxReturnCollection
        .doc(update.id)
        .update(update.toModel().toDocument());
  }
}
