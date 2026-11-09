import '../data/app_database.dart';
import '../models/listing_draft.dart' as model;

abstract interface class ListingDraftRepository {
  Stream<List<model.ListingDraft>> watchDrafts();
  Future<void> addDraft({
    required String title,
    required String category,
    required String description,
    required String imagePath,
  });
  Future<void> deleteDraft(int id);
}

class ListingDraftRepositoryDrift implements ListingDraftRepository {
  final AppDatabase db;
  ListingDraftRepositoryDrift(this.db);
  @override
  Stream<List<model.ListingDraft>> watchDrafts() => db
      .select(db.listingDrafts)
      .watch()
      .map(
        (r) => r
            .map(
              (e) => model.ListingDraft(
                id: e.id,
                title: e.title,
                category: e.category,
                description: e.description,
                imagePath: e.imagePath,
              ),
            )
            .toList(),
      );
  @override
  Future<void> addDraft({
    required String title,
    required String category,
    required String description,
    required String imagePath,
  }) => db
      .into(db.listingDrafts)
      .insert(
        ListingDraftsCompanion.insert(
          title: title,
          category: category,
          description: description,
          imagePath: imagePath,
        ),
      );
  @override
  Future<void> deleteDraft(int id) =>
      (db.delete(db.listingDrafts)..where((t) => t.id.equals(id))).go();
}
