import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sync_scrollable_list_tabs/src/view_models/detail_store_vm.dart';
import 'package:sync_scrollable_list_tabs/src/views/detail_store_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailStoreViewModel(),
      child: const MaterialApp(
        title: 'Sync Scrollable Listview Tabs',
        debugShowCheckedModeBanner: false,
        home: DetailStoreScreen(),
      ),
    );
  }
}