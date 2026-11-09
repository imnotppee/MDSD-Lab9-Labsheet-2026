# Campus Marketplace — Lab 9

แอป Flutter สำหรับใบงาน Firebase Authentication, Cloud Firestore และ Firebase Storage โดยมี Local Database (Drift) สำหรับรายการโปรดและร่างประกาศ

## ตั้งค่าก่อนรัน

ส่วนที่ต้องใช้บัญชี Firebase ของผู้ส่งงานไม่สามารถกำหนดแทนกันได้ ให้ทำครั้งเดียวตามลำดับ:

```powershell
npm install -g firebase-tools
firebase login
dart pub global activate flutterfire_cli
flutterfire configure
flutter pub get
dart run build_runner build
flutter run
```

ใน `flutterfire configure` ให้เลือก Firebase Project ของตนเองและ Android จากนั้นใน Firebase Console:

1. Authentication → Sign-in method: เปิด Email/Password และ Google
2. Project settings → Android app: เพิ่ม SHA-1 จาก `cd android; ./gradlew signingReport`
3. สร้าง Firestore Database และ Storage
4. นำเนื้อหา `firestore.rules` และ `storage.rules` ไป Publish ใน Console

ไฟล์ `lib/firebase_options.dart` ปัจจุบันเป็น placeholder เพื่อให้โปรเจกต์คอมไพล์ได้ และจะแสดงหน้าคำแนะนำแทนการ crash; `flutterfire configure` จะเขียนทับด้วยค่าจริง

## สิ่งที่ทำครบ

- สมัคร/เข้าสู่ระบบ Email/Password พร้อมแปล Firebase error เป็นภาษาไทย
- Google Sign-In และ AuthGate ด้วย `authStateChanges()`
- Repository Pattern: Fake Store API + Firestore และรวมผลด้วย `Future.wait`
- Badge แยกสินค้า API (`🏪`) กับโพสต์นักศึกษา (`🎓`)
- Favorites และ Drafts แบบ offline ด้วย Drift
- เลือกรูป บันทึกร่าง ถามราคา อัปโหลด Storage แล้วโพสต์ Firestore
- ลบร่างหลังโพสต์สำเร็จ ป้องกันโพสต์ซ้ำ และแสดง progress/error
- Firestore/Storage Security Rules

## ตรวจสอบคุณภาพ

```powershell
flutter analyze
flutter test
```

คำตอบเชิงอธิบายและรายการ Checkpoint อยู่ใน `LAB_REPORT.md`
