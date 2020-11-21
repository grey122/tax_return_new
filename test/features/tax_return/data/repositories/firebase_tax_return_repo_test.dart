import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mockito/mockito.dart';
import 'package:tax_return/feature/tax_return/data/repositories/repositories_export.dart';
import 'package:tax_return/feature/tax_return/domain/entities/entities_export.dart';
import 'package:tax_return/feature/tax_return/domain/repositories/repositories_export.dart';

class MocKCollectionRefrence extends Mock implements CollectionReference {}

class MockTaxReturnRepository extends Mock
    implements FirebaseTaxReturnRepository {}

class MockFirebaseFireStore extends Mock implements FirebaseFirestore {}

class MockDocumentRefrence extends Mock implements DocumentReference {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {
  final Map<String, dynamic> docData;

  MockDocumentSnapshot([this.docData]);

  @override
  dynamic operator [](dynamic field) => get(docData[field]);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFirebase.channel.setMockMethodCallHandler((call) async {
    if (call.method == 'Firebase#initializeCore') {
      return [
        {
          'name': defaultFirebaseAppName,
          'options': {
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
          },
          'pluginConstants': const <String, String>{},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      return <String, dynamic>{
        'name': call.arguments['appName'],
        'options': call.arguments['options'],
        'pluginConstants': const <String, String>{},
      };
    }

    return null;
  });

  TestWidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  group('Firebase Repository Test', () {
    final String taxName = 'tax_name';
    final String taxId = 'tax_id';

    MocKCollectionRefrence collectionReference;
    FirebaseTaxReturnRepository firebaseTaxReturnRepository;
    MockFirebaseFireStore firebaseFirestore;
    MockDocumentRefrence documentReference;
    MockDocumentRefrence documentRefrenceB;

    final TaxReturn taxReturn = TaxReturn(taxName: taxName, id: taxId);

    setUp(() {
      //collectionReference = firebaseFirestore.collection('tax_return');

      collectionReference = MocKCollectionRefrence();

      firebaseFirestore = MockFirebaseFireStore();
      documentReference = MockDocumentRefrence();
      firebaseTaxReturnRepository =
          FirebaseTaxReturnRepository(firebaseFirestore);
      documentRefrenceB = MockDocumentRefrence();
    });

    test('verify if add new todo is called', () async {
      when(firebaseFirestore.collection(FirebaseTaxReturnRepository.path))
          .thenReturn(collectionReference);
      when(collectionReference.doc(taxReturn.id)).thenReturn(documentReference);

      await firebaseTaxReturnRepository.addNewTaxReturn(taxReturn);

      verify(collectionReference.add(taxReturn.toModel().toDocument()));
    });

    test('verify if update todo is called', () async {
      when(firebaseFirestore.collection(FirebaseTaxReturnRepository.path))
          .thenReturn(collectionReference);
      when(collectionReference.doc(taxReturn.id)).thenReturn(documentReference);

      await firebaseTaxReturnRepository.updateTaxReturn(taxReturn);

      verify(documentReference.update(taxReturn.toModel().toDocument()));
    });

//FIXME write better test to check for updates to collection
    // test('should listen for updates to the collection', () {
    //   final snapshots = Stream.fromIterable([querySnapshot]);
    //   final document = MockDocumentSnapshot(taxReturn.toModel().toDocument());

    //   when(firebaseFirestore.collection(FirebaseTaxReturnRepository.path))
    //       .thenReturn(collectionReference);
    //   when(collectionReference.snapshots()).thenAnswer((_) => snapshots);
    //   when(querySnapshot.docs).thenReturn([document.;
    //   when(document.id).thenReturn(taxReturn.id);

    //   expect(firebaseTaxReturnRepository.taxReturns(), emits([taxReturn]));
    // });
//FIXME fix this delete todo too
    // test('verify if delete todo is called', () async {
    //   final dataA = 'a';
    //   final dataB = 'b';
    //   when(firebaseFirestore.collection(FirebaseTaxReturnRepository.path))
    //       .thenReturn(collectionReference);
    //   when(collectionReference.doc(dataA)).thenReturn(documentReference);
    //   when(collectionReference.doc(dataB)).thenReturn(documentRefrenceB);

    //   when(documentReference.delete()).thenAnswer((_) => Future.value());
    //   when(documentRefrenceB.delete()).thenAnswer((_) => Future.value());

    //   await firebaseTaxReturnRepository.deleteTaxReturn(taxReturn);
    // });
  });
}
