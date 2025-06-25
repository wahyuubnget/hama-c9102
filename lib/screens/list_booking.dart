import 'package:flutter/material.dart';

class ListBooking extends StatelessWidget {
  final List<String> bookings = [
    'Ruang A - 10 Juni - Andi',
    'Ruang B - 11 Juni - Budi',
  ];

  ListBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List Booking",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade600,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            bookings.isNotEmpty
                ? ListView.separated(
                  itemCount: bookings.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          child: const Icon(
                            Icons.meeting_room,
                            color: Colors.blue,
                          ),
                        ),
                        title: Text(
                          bookings[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                        onTap: () {
                          // Aksi jika ingin menambahkan detail
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Detail: ${bookings[index]}"),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
                : const Center(
                  child: Text(
                    "Belum ada data booking.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
      ),
    );
  }
}
