import 'package:drift/drift.dart';
import '../data/app_database.dart';
import '../models/item.dart';

abstract interface class FavoritesRepository {
  Stream<List<Item>> watchFavorites();
  Future<void> toggle(Item item);
  Future<bool> contains(String id);
}

class FavoritesRepositoryDrift implements FavoritesRepository {
  final AppDatabase db;
  FavoritesRepositoryDrift(this.db);
  @override
  Stream<List<Item>> watchFavorites() => db
      .select(db.favoriteItems)
      .watch()
      .map(
        (rows) => rows
            .map(
              (r) => Item(
                id: r.itemId,
                title: r.title,
                price: r.price,
                description: '',
                category: 'รายการโปรด',
                imageUrl: r.imageUrl,
              ),
            )
            .toList(),
      );
  @override
  Future<bool> contains(String id) async =>
      (await (db.select(
        db.favoriteItems,
      )..where((t) => t.itemId.equals(id))).getSingleOrNull()) !=
      null;
  @override
  Future<void> toggle(Item item) async {
    if (await contains(item.id)) {
      await (db.delete(
        db.favoriteItems,
      )..where((t) => t.itemId.equals(item.id))).go();
    } else {
      await db
          .into(db.favoriteItems)
          .insert(
            FavoriteItemsCompanion.insert(
              itemId: item.id,
              title: item.title,
              price: item.price,
              imageUrl: item.imageUrl,
            ),
            mode: InsertMode.insertOrReplace,
          );
    }
  }
}
