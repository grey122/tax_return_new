import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tax_return/feature/tax_return/data/model/model_export.dart';
import 'package:tax_return/feature/tax_return/domain/entities/entities_export.dart';
import 'package:tax_return/feature/tax_return/domain/repositories/repositories_export.dart';

//TODO: implement the other test and logic
class FirebaseTaxReturnRepository implements TaxReturnRepository {
  final FirebaseFirestore firebaseFirestore;
  static const String path = 'tax_return';

  //final taxReturnCollection = FirebaseFirestore.instance.collection(path);

  FirebaseTaxReturnRepository(this.firebaseFirestore);

  @override
  Future<void> addNewTaxReturn(TaxReturn taxReturn) {
    return firebaseFirestore
        .collection(path)
        .add(taxReturn.toModel().toDocument());
  }

  @override
  Future<void> deleteTaxReturn(TaxReturn taxReturn) {
    return firebaseFirestore.collection(path).doc(taxReturn.id).delete();
  }

  @override
  Stream<List<TaxReturn>> taxReturns() {
    return firebaseFirestore.collection(path).snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => TaxReturn.fromModel(TaxReturnModel.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateTaxReturn(TaxReturn update) {
    return firebaseFirestore
        .collection(path)
        .doc(update.id)
        .update(update.toModel().toDocument());
  }
}
