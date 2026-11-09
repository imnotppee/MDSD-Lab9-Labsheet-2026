import 'package:flutter/material.dart';
import '../models/item.dart';
import '../repositories/favorites_repository.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final FavoritesRepository favorites;
  const ItemCard({super.key, required this.item, required this.favorites});
  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.antiAlias,
    child: Row(
      children: [
        SizedBox(
          width: 110,
          height: 120,
          child: item.imageUrl.isEmpty
              ? const Icon(Icons.image_not_supported)
              : Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(item.sellerId == null ? '🏪 API' : '🎓 Campus'),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '฿${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.indigo, fontSize: 17),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () => favorites.toggle(item),
                    icon: const Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
