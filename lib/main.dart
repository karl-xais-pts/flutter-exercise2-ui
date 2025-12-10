import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ToolsProvider(),
      child: const MyApp(),
    ),
  );
}

/// Root app widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Interview Exercise',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ExampleScreen(),
    );
  }
}

// ---------------------------------------------------------------------------
// ExampleScreen
// ---------------------------------------------------------------------------

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  final _dataService = DataService();
  bool isLoading = false;
  List<String> tools = [];

  Future<void> _loadTools() async {
    setState(() => isLoading = true);
    final fetched = await _dataService.fetchTools();
    setState(() {
      tools = fetched;
      isLoading = false;
    });

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Loaded ${tools.length} tools')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ToolsProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Example Screen')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // --- Classic setState() version ---
            ElevatedButton(
              onPressed: _loadTools,
              child: Text(isLoading ? 'Loading...' : 'Load Data'),
            ),

            const SizedBox(height: 12),

            // --- Provider demonstration (optional) ---
            ElevatedButton(
              onPressed: () async => provider.loadTools(),
              child: Text(
                provider.isLoading
                    ? 'Loading (Provider)...'
                    : 'Load using Provider',
              ),
            ),

            const Divider(),

            Expanded(
              child: ListView.builder(
                itemCount: tools.isNotEmpty
                    ? tools.length
                    : provider.tools.length,
                itemBuilder: (context, index) {
                  final name = tools.isNotEmpty
                      ? tools[index]
                      : provider.tools[index];
                  return ItemCard(name: name);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Simple reusable widget
// ---------------------------------------------------------------------------

class ItemCard extends StatelessWidget {
  final String name;
  const ItemCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.blue.shade50,
      child: ListTile(
        leading: const Icon(Icons.settings),
        title: Text(name, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Mock Data Service  (to simulate async fetching)
// ---------------------------------------------------------------------------

class DataService {
  /// Simulates a network call and basic filtering/sorting
  Future<List<String>> fetchTools() async {
    await Future.delayed(const Duration(seconds: 1));
    final functionality = ['Sections', 'Assets', 'Schemes', 'SALs', 'iRAP'];
    return functionality.toList();
  }
}

// ---------------------------------------------------------------------------
// Provider-based State Management Example (optional)
// ---------------------------------------------------------------------------

class ToolsProvider extends ChangeNotifier {
  final DataService _service = DataService();
  bool isLoading = false;
  List<String> tools = [];

  Future<void> loadTools() async {
    isLoading = true;
    notifyListeners();
    try {
      tools = await _service.fetchTools();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
