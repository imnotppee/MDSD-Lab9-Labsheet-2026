import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'data/app_database.dart';
import 'firebase_options.dart';
import 'repositories/favorites_repository.dart';
import 'repositories/item_repository_api.dart';
import 'repositories/item_repository_firestore.dart';
import 'repositories/listing_draft_repository.dart';
import 'screens/auth_gate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final options = DefaultFirebaseOptions.currentPlatform;
  if (options.projectId == 'replace-with-your-project') {
    runApp(const FirebaseSetupApp());
    return;
  }
  await Firebase.initializeApp(options: options);
  final db = AppDatabase();
  runApp(MyApp(database: db));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;
  const MyApp({super.key, required this.database});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Campus Marketplace',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorSchemeSeed: Colors.indigo,
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    ),
    home: AuthGate(
      itemRepositories: [ItemRepositoryApi(), ItemRepositoryFirestore()],
      favoritesRepository: FavoritesRepositoryDrift(database),
      draftRepository: ListingDraftRepositoryDrift(database),
    ),
  );
}

class FirebaseSetupApp extends StatelessWidget {
  const FirebaseSetupApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
    home: const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cloud_off, size: 72, color: Colors.indigo),
              SizedBox(height: 20),
              Text(
                'ต้องเชื่อม Firebase ก่อน',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              SelectableText(
                '1. firebase login\n2. flutterfire configure\n3. เลือก Firebase Project และ Android\n4. flutter run',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                'คำสั่ง flutterfire configure จะสร้าง lib/firebase_options.dart ด้วยค่าจริงให้โดยอัตโนมัติ',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
