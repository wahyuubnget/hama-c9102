import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Ruangan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari Ruangan',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Greeting
            const Text(
              'Halo, Nama Pengguna',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Booking hari ini
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 8),
                        Text(
                          'Booking Hari Ini:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('• Ruang Meeting A (10:00 - 11:00)'),
                    Text('• Ruang Kelas B (13:00 - 15:00)'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol booking baru dan ikon navigasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigasi ke halaman booking baru
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Buat Booking Baru'),
                ),
                IconButton(
                  onPressed: () {
                    // Navigasi ke halaman lain
                  },
                  icon: const Icon(Icons.arrow_forward),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
