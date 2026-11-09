import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/item.dart';
import 'item_repository.dart';

class ItemRepositoryFirestore implements ItemRepository {
  final CollectionReference<Map<String, dynamic>> _items;
  ItemRepositoryFirestore({FirebaseFirestore? firestore})
    : _items = (firestore ?? FirebaseFirestore.instance).collection('items');
  @override
  Future<List<Item>> getItems() async =>
      (await _items.get()).docs.map(Item.fromFirestore).toList();
  Future<void> postItem(Item item) => _items.add(item.toFirestore());
  Stream<List<Item>> watchMyListings(String sellerId) => _items
      .where('sellerId', isEqualTo: sellerId)
      .snapshots()
      .map((s) => s.docs.map(Item.fromFirestore).toList());
}
