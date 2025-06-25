import 'package:flutter/material.dart';

class RiwayatRuangan extends StatefulWidget {
  const RiwayatRuangan({super.key});

  @override
  State<RiwayatRuangan> createState() => _RiwayatRuanganState();
}

class _RiwayatRuanganState extends State<RiwayatRuangan> {
  final List<String> history = [
    'Ruang A - 8 Juni - Selesai',
    'Ruang B - 9 Juni - Selesai',
    'Ruang C - 10 Juni - Selesai',
    'Ruang D - 11 Juni - Batal',
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredData = history
        .where((item) => item.toLowerCase().contains(searchQuery.toLowerCase()))
        .map((item) => item.split(' - '))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Riwayat Ruangan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Field
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Cari riwayat...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Tabel Data
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 40,
                      headingRowColor: WidgetStateColor.resolveWith(
                        (states) => Colors.blue.shade100,
                      ),
                      dataRowMinHeight: 60,
                      dataRowMaxHeight: 60,
                      headingTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      border: TableBorder.all(color: Colors.grey.shade300),
                      columns: const [
                        DataColumn(label: Text('Nama Ruangan')),
                        DataColumn(label: Text('Tanggal')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows: filteredData
                          .map(
                            (row) => DataRow(
                              cells: [
                                DataCell(Text(row[0])),
                                DataCell(Text(row[1])),
                                DataCell(
                                  Text(
                                    row.length > 2 ? row[2] : 'Tidak diketahui',
                                    style: TextStyle(
                                      color: (row.length > 2 && row[2] == 'Selesai')
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
