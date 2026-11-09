import 'package:flutter/material.dart';
import '../models/item.dart';
import '../repositories/item_repository.dart';
import '../repositories/favorites_repository.dart';
import '../services/auth_service.dart';
import '../widgets/item_card.dart';

class HomePage extends StatefulWidget {
  final List<ItemRepository> repositories;
  final FavoritesRepository favoritesRepository;
  const HomePage({
    super.key,
    required this.repositories,
    required this.favoritesRepository,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Item>> _future;
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() => _future = Future.wait(
    widget.repositories.map((r) => r.getItems()),
  ).then((all) => all.expand((e) => e).toList());
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Campus Marketplace'),
      actions: [
        IconButton(
          tooltip: 'ออกจากระบบ',
          onPressed: () => AuthService().signOut(),
          icon: const Icon(Icons.logout),
        ),
      ],
    ),
    body: RefreshIndicator(
      onRefresh: () async {
        setState(_load);
        await _future;
      },
      child: FutureBuilder<List<Item>>(
        future: _future,
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());
          if (s.hasError)
            return ListView(
              children: [
                const SizedBox(height: 180),
                Icon(Icons.cloud_off, size: 60, color: Colors.grey),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'โหลดข้อมูลไม่สำเร็จ\n${s.error}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            );
          final items = s.data ?? [];
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (_, i) =>
                ItemCard(item: items[i], favorites: widget.favoritesRepository),
          );
        },
      ),
    ),
  );
}
