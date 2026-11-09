import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/item.dart';
import '../models/listing_draft.dart';
import '../repositories/item_repository_firestore.dart';
import '../repositories/listing_draft_repository.dart';
import '../services/storage_service.dart';

class MyDraftsPage extends StatefulWidget {
  final ListingDraftRepository draftRepository;
  const MyDraftsPage({super.key, required this.draftRepository});
  @override
  State<MyDraftsPage> createState() => _MyDraftsPageState();
}

class _MyDraftsPageState extends State<MyDraftsPage> {
  int? _uploading;
  Future<double?> _askPrice() async {
    final c = TextEditingController();
    final value = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('ราคาสินค้า'),
        content: TextField(
          controller: c,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'ราคา (บาท)',
            errorMaxLines: 2,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('ยกเลิก'),
          ),
          FilledButton(
            onPressed: () {
              final p = double.tryParse(c.text);
              if (p != null && p > 0)
                Navigator.pop(ctx, p);
              else
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(
                    content: Text('ราคาต้องเป็นตัวเลขที่มากกว่า 0'),
                  ),
                );
            },
            child: const Text('โพสต์'),
          ),
        ],
      ),
    );
    return value;
  }

  Future<void> _post(ListingDraft d) async {
    final price = await _askPrice();
    if (price == null) return;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    setState(() => _uploading = d.id);
    try {
      final url = await StorageService().uploadListingImage(
        File(d.imagePath),
        user.uid,
      );
      final item = Item(
        id: '',
        title: d.title,
        price: price,
        description: d.description,
        category: d.category,
        imageUrl: url,
        sellerId: user.uid,
      );
      await ItemRepositoryFirestore().postItem(item);
      await widget.draftRepository.deleteDraft(d.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 8),
            backgroundColor: Colors.green,
            content: Text('โพสต์ขายจริงสำเร็จ'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 10),
            backgroundColor: Colors.red.shade800,
            content: Text('โพสต์ไม่สำเร็จ: ตรวจสอบอินเทอร์เน็ตแล้วลองใหม่\n$e'),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _uploading = null);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('ร่างของฉัน')),
    body: StreamBuilder<List<ListingDraft>>(
      stream: widget.draftRepository.watchDrafts(),
      builder: (c, s) {
        final drafts = s.data ?? [];
        if (drafts.isEmpty)
          return const Center(child: Text('ยังไม่มีร่างประกาศ'));
        return ListView.builder(
          itemCount: drafts.length,
          itemBuilder: (_, i) {
            final d = drafts[i], busy = _uploading == d.id;
            return Card(
              child: ListTile(
                leading: Image.file(
                  File(d.imagePath),
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                ),
                title: Text(d.title),
                subtitle: Text(d.category),
                trailing: busy
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : FilledButton(
                        onPressed: _uploading == null ? () => _post(d) : null,
                        child: const Text('โพสต์ขายจริง'),
                      ),
              ),
            );
          },
        );
      },
    ),
  );
}
