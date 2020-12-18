import 'package:flutter_design_patterns/design_patterns/bridge/entity/entity_base.dart';

abstract class IStorage {
  String getTitle();
  List<T> fetchAll<T extends EntityBase>();
  void store<T extends EntityBase>(T entityBase);
}