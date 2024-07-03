import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:my_andalas/Styles/Theme.dart';
import 'package:my_andalas/Views/Component/Button.dart';


class AddLogbook extends StatefulWidget {
  const AddLogbook({super.key});

  @override
  State<AddLogbook> createState() => _AddLogbookState();
}

class _AddLogbookState extends State<AddLogbook> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF008043)),
        title: const Text('Tambah Logbook'),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: const Color(0xFFE5E5E5),
              height: 1.0,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    hintText: "Pilih tanggal",
                    filled: true,
                    fillColor: white,
                    prefixIcon: Icon(
                      IconlyLight.calendar,
                      color: green1,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                  onTap: _selectDate,
                ),
                const Gap(24),
                const Text(
                  "Aktivitas",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'SF-Pro-Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(8),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      filled: true,
                      fillColor: const Color(0xA5E3E3E3),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText:
                          'Contoh Bertemu dengan pembimbing akademik untuk diskusi mengenai kerangka kerja tugas akhir.',
                      hintStyle: const TextStyle(
                        color: Color(0xFF6F6F6F),
                        fontFamily: 'SF-Pro-Display',
                      )),
                  maxLines: 9,
                  maxLength: 300,
                ),
                const Gap(16),
                const Text(
                  "Catatan",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'SF-Pro-Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(8),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      filled: true,
                      fillColor: const Color(0xA5E3E3E3),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText:
                          'Contoh Bertemu dengan pembimbing akademik untuk diskusi mengenai kerangka kerja tugas akhir.',
                      hintStyle: const TextStyle(
                        color: Color(0xFF6F6F6F),
                        fontFamily: 'SF-Pro-Display',
                      )),
                  maxLines: 4,
                  maxLength: 100,
                ),
                const Gap(24),
                ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {},
                    child: const Text(
                      "Kirim",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
