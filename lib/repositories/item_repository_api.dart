import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';
import 'item_repository.dart';

class ItemRepositoryApi implements ItemRepository {
  @override
  Future<List<Item>> getItems() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products'))
        .timeout(const Duration(seconds: 15));
    if (response.statusCode != 200)
      throw Exception('โหลดสินค้าจาก API ไม่สำเร็จ');
    return (jsonDecode(response.body) as List)
        .map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
