library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:tax_return/feature/tax_return/data/model/tax_return_model_built.dart';
import 'package:tax_return/feature/tax_return/data/model/user_model/user_model.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  TaxReturnModelBuilt,
  UserModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
