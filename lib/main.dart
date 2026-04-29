import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedImage;

  void showImage(String path) {
    setState(() {
      selectedImage = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => showImage('assets/photo1.png'),
                    child: const Text('photo 1'),
                  ),
                  TextButton(
                    onPressed: () => showImage('assets/photo2.png'),
                    child: const Text('photo 2'),
                  ),
                  TextButton(
                    onPressed: () => showImage('assets/photo3.png'),
                    child: const Text('photo 3'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: selectedImage == null
                    ? const SizedBox()
                    : Image.asset(
                        selectedImage!,
                        fit: BoxFit.contain,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}