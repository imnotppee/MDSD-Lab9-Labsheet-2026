import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../repositories/listing_draft_repository.dart';
import 'my_drafts_page.dart';

class SellItemPage extends StatefulWidget {
  final ListingDraftRepository draftRepository;
  const SellItemPage({super.key, required this.draftRepository});
  @override
  State<SellItemPage> createState() => _SellItemPageState();
}

class _SellItemPageState extends State<SellItemPage> {
  final _form = GlobalKey<FormState>(),
      _title = TextEditingController(),
      _category = TextEditingController(),
      _description = TextEditingController();
  String? _imagePath;
  bool _saving = false;
  Future<void> _pick() async {
    final x = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (x != null) setState(() => _imagePath = x.path);
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate() || _imagePath == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('กรุณาเลือกรูปสินค้า')));
      return;
    }
    setState(() => _saving = true);
    await widget.draftRepository.addDraft(
      title: _title.text.trim(),
      category: _category.text.trim(),
      description: _description.text.trim(),
      imagePath: _imagePath!,
    );
    if (mounted) {
      _form.currentState!.reset();
      _title.clear();
      _category.clear();
      _description.clear();
      setState(() {
        _imagePath = null;
        _saving = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('บันทึกร่างแล้ว')));
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('ลงขายสินค้า'),
      actions: [
        IconButton(
          tooltip: 'ร่างของฉัน',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  MyDraftsPage(draftRepository: widget.draftRepository),
            ),
          ),
          icon: const Icon(Icons.drafts),
        ),
      ],
    ),
    body: Form(
      key: _form,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: _title,
            decoration: const InputDecoration(labelText: 'ชื่อสินค้า'),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'กรุณากรอกชื่อสินค้า' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _category,
            decoration: const InputDecoration(labelText: 'หมวดหมู่'),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'กรุณากรอกหมวดหมู่' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _description,
            maxLines: 4,
            decoration: const InputDecoration(labelText: 'รายละเอียด'),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'กรุณากรอกรายละเอียด' : null,
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: _pick,
            icon: const Icon(Icons.image),
            label: Text(_imagePath == null ? 'เลือกรูปสินค้า' : 'เลือกรูปแล้ว'),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const CircularProgressIndicator()
                : const Text('บันทึกร่าง'),
          ),
        ],
      ),
    ),
  );
  @override
  void dispose() {
    _title.dispose();
    _category.dispose();
    _description.dispose();
    super.dispose();
  }
}
