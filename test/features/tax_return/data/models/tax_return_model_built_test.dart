import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tax_return/feature/tax_return/data/model/tax_model.dart';
import 'package:mockito/mockito.dart';
import 'package:tax_return/feature/tax_return/data/model/tax_return_model_built.dart';

class MockFirebaseFireStore extends Mock implements FirebaseFirestore {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  final String taxName = 'tax_name';
  final String taxId = 'tax_id';
  // group('TaxReturn model', () {
  // test('supports value comparisim', () {
  //   expect(TaxReturnModel(), TaxReturnModel());
  // });

  // test('check if class is value comparable rather than object compareable',
  //     () {
  //   expect(
  //       TaxReturnModel(id: taxId, taxName: taxName) ==
  //               TaxReturnModel(id: taxId, taxName: taxName)
  //           ? true
  //           : false,
  //       true);
  // });

  //   test('test that toJson Maps to json properly', () {
  //     //note
  //     final Map<String, Object> _taxDocMap = {"taxName": taxName, "id": taxId};
  //     final jsonBuilt = TaxReturnModelBuilt((b) => b
  //       ..taxName = taxName
  //       ..id = taxId).toJson();
  //     final jsonNorm = TaxReturnModel(taxName: 'John', id: '2')..toJson();

  //     print(_taxDocMap);
  //     print(jsonBuilt);
  //     print(jsonNorm);

  //     expect(
  //         TaxReturnModelBuilt((b) => b
  //           ..taxName = taxName
  //           ..id = taxId).toJson(),
  //         _taxDocMap);
  //   });

  //   test(
  //       'expect when fromjson is called it gets the json represtation of the object and give it its approiate data type',
  //       () {
  //     Map<String, Object> json = {"taxName": taxName, "id": taxId};

  //     expect(TaxReturnModel.fromJson(json),
  //         TaxReturnModel(id: json["id"], taxName: json["taxName"]));
  //   });
  // });

  group('firebaseTaxModel', () {
    Map<String, Object> firebaseMap = {"taxName": taxName, "id": taxId};
    DocumentSnapshot snapshot;
    setUp(() {
      snapshot = MockDocumentSnapshot();
    });
    test(
        'check when taxreturnmodel.fromsnapshot is called  it returns the appropriate document ',
        () {
      when(snapshot.data()).thenReturn(firebaseMap);
      expect(
          TaxReturnModelBuilt.fromSnapshot(snapshot),
          TaxReturnModelBuilt((b) => b
            ..taxName = snapshot.data()['taxName']
            ..id = snapshot.id));
    });

    test('check if TaxReturnModel.toDocument maps apporiately', () {
      Map<String, Object> firebaseDocMap = {"taxName": taxName};
      expect(TaxReturnModel(taxName: taxName).toDocument(), firebaseDocMap);
    });
  });
}
