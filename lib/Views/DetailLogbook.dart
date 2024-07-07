import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_andalas/Models/LogbooksModel.dart';
import 'package:my_andalas/Views/Component/Button.dart'; // Import LogbookModel

class DetailScreenLogbook extends StatelessWidget {
  final Log log;

  const DetailScreenLogbook({super.key, required this.log});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Logbook'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masalah: ${log.problem}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "Kemajuan: ${log.progress}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Catatan: ${log.notes}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Status: ${log.status}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Tanggal: ${DateFormat('dd MMMM yyyy').format(log.date!)}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {},
                style: buttonPrimary,
                child: const Text(
                  "Revisi",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
