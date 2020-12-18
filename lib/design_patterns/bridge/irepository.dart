import 'package:flutter_design_patterns/design_patterns/bridge/entity/entity_base.dart';

abstract class IRepository {
  List<EntityBase> getAll();
  void save(EntityBase entityBase);
}