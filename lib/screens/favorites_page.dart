import 'package:flutter/material.dart';
import '../repositories/favorites_repository.dart';
import '../widgets/item_card.dart';

class FavoritesPage extends StatelessWidget {
  final FavoritesRepository repository;
  const FavoritesPage({super.key, required this.repository});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('รายการโปรด')),
    body: StreamBuilder(
      stream: repository.watchFavorites(),
      builder: (c, s) {
        final items = s.data ?? [];
        if (items.isEmpty)
          return const Center(child: Text('ยังไม่มีรายการโปรด'));
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (_, i) =>
              ItemCard(item: items[i], favorites: repository),
        );
      },
    ),
  );
}
