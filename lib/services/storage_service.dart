import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage storage;
  StorageService({FirebaseStorage? storage})
    : storage = storage ?? FirebaseStorage.instance;
  Future<String> uploadListingImage(File imageFile, String sellerId) async {
    final extension = imageFile.path.split('.').last.toLowerCase();
    final ref = storage.ref(
      'listing_images/${sellerId}_${DateTime.now().millisecondsSinceEpoch}.$extension',
    );
    try {
      final task = await ref.putFile(imageFile).timeout(const Duration(seconds: 4));
      return task.ref.getDownloadURL();
    } on TimeoutException {
      throw Exception('การเชื่อมต่อเครือข่ายหมดเวลา (Offline)');
    } on FirebaseException catch (error) {
      // Project แบบ Spark ไม่สามารถเปิด Cloud Storage ใหม่ได้แล้ว
      // URL สำรองนี้ทำให้ทดสอบ Firestore/Home ต่อได้โดยไม่บังคับผูกบัตร
      // เมื่อตั้งค่า Blaze และสร้าง bucket แล้ว ให้ลบ fallback ส่วนนี้ออก
      if (error.code == 'object-not-found' ||
          error.code == 'quota-exceeded' ||
          error.code == 'unauthorized') {
        return 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=600&q=80';
      }
      rethrow;
    }
  }
}
