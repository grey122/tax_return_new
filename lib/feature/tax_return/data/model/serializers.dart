library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:tax_return/feature/tax_return/data/model/tax_return_model_built.dart';

part 'serializers.g.dart';

@SerializersFor(const [TaxReturnModelBuilt])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
