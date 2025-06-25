import 'package:flutter/material.dart';

class TambahRuangan extends StatefulWidget {
  const TambahRuangan({super.key});

  @override
  State<TambahRuangan> createState() => _TambahRuanganState();
}

class _TambahRuanganState extends State<TambahRuangan> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kapasitasController = TextEditingController();

  void _simpan(BuildContext context) {
    if (_namaController.text.isNotEmpty &&
        _kapasitasController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ruangan berhasil ditambahkan")),
      );
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
      appBar: AppBar(title: const Text("Tambah Ruangan")),
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
