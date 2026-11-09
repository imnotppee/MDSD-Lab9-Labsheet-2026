import '../models/item.dart';

abstract interface class ItemRepository {
  Future<List<Item>> getItems();
}
