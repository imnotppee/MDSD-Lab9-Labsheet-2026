import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String imageUrl;
  final String? sellerId;

  const Item({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    this.sellerId,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: '${json['id']}',
    title: json['title'] as String? ?? '',
    price: (json['price'] as num?)?.toDouble() ?? 0,
    description: json['description'] as String? ?? '',
    category: json['category'] as String? ?? '',
    imageUrl: json['image'] as String? ?? '',
  );

  Map<String, dynamic> toFirestore() => {
    'title': title,
    'price': price,
    'description': description,
    'category': category,
    'imageUrl': imageUrl,
    'sellerId': sellerId,
    'createdAt': FieldValue.serverTimestamp(),
  };

  factory Item.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? {};
    final storedImageUrl = data['imageUrl'] as String? ?? '';
    // แก้เฉพาะข้อมูลทดสอบเก่าที่อ้าง fakestore image endpoint ซึ่งตอบ 403
    // เพื่อให้หน้า Home ยังคงแสดงภาพได้ระหว่างที่โปรเจกต์ยังเปิด Storage ไม่ได้
    final displayImageUrl = storedImageUrl.contains('fakestoreapi.com/img/')
        ? 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=600&q=80'
        : storedImageUrl;
    return Item(
      id: doc.id,
      title: data['title'] as String? ?? '',
      price: (data['price'] as num?)?.toDouble() ?? 0,
      description: data['description'] as String? ?? '',
      category: data['category'] as String? ?? '',
      imageUrl: displayImageUrl,
      sellerId: data['sellerId'] as String?,
    );
  }
}
