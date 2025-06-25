import 'package:flutter/material.dart';

class EditRuangan extends StatefulWidget {
  const EditRuangan({super.key});

  @override
  State<EditRuangan> createState() => _EditRuanganState();
}

class _EditRuanganState extends State<EditRuangan> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kapasitasController = TextEditingController();

  void _simpan(BuildContext context) {
    if (_namaController.text.isNotEmpty &&
        _kapasitasController.text.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Ruangan berhasil diedit")));
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _kapasitasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Ruangan")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: "Nama Ruangan",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _kapasitasController,
              decoration: const InputDecoration(
                labelText: "Kapasitas",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _simpan(context),
              child: const Text("Simpan Ruangan"),
            ),
          ],
        ),
      ),
    );
  }
}
