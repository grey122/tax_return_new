import 'package:tax_return/feature/tax_return/domain/entities/user_entity/user_entity_export.dart';
import 'package:built_collection/built_collection.dart';

final entity = UserEntity((b) => b
  ..userName = ''
  ..emailAddress = ''
  ..userContact = ''
  ..taxReturnType = ''
  ..cityPage = {'company category': 'banking and finace'}.build().toBuilder());
