import 'package:flutter/material.dart';

class DaftarRuangan extends StatelessWidget {
  final List<Map<String, String>> ruanganList = [
    {'nama': 'Ruang A', 'kapasitas': '30'},
    {'nama': 'Ruang B', 'kapasitas': '20'},
    {'nama': 'Ruang C', 'kapasitas': '50'},
  ];

  DaftarRuangan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Ruangan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade600,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: ruanganList.length,
          itemBuilder: (context, index) {
            final ruang = ruanganList[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: const Icon(Icons.meeting_room, color: Colors.blue),
                ),
                title: Text(
                  ruang['nama']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  "Kapasitas: ${ruang['kapasitas']} orang",
                  style: const TextStyle(color: Colors.black54),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit-ruangan');
                  },
                  tooltip: 'Edit Ruangan',
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/tambah-ruangan'),
        label: const Text("Tambah"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blue.shade600,
      ),
    );
  }
}
