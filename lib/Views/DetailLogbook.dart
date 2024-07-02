import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_andalas/Models/LogbookModel.dart';
import 'package:my_andalas/Styles/style.dart';
import 'package:my_andalas/Views/Widgets/Button.dart';

class DetailScreenLogbook extends StatelessWidget {
  final Logbook logbook;

  const DetailScreenLogbook({super.key, required this.logbook});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF008043)),
        title: const Text('Detail Logbook'),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: const Color(0xFFE5E5E5),
              height: 1.0,
            )),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                logbook.status,
                style: TextStyle(
                  color: statusStyles[logbook.status]?['color'],
                  fontSize: 14,
                  fontFamily: 'SF-Pro-Display',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap(16),
              Text(
                "${logbook.day}\n${logbook.date}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(16),
              const Text(
                "Aktivitas :",
                style: TextStyle(
                  color: Color(0xFF6F6F6F),
                  fontSize: 14,
                  fontFamily: 'SF-Pro-Display',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap(4),
              Text(
                logbook.activity,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'SF-Pro-Display',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap(24),
              const Text(
                "Catatan :",
                style: TextStyle(
                  color: Color(0xFF6F6F6F),
                  fontSize: 14,
                  fontFamily: 'SF-Pro-Display',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap(4),
              Text(
                logbook.notes,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'SF-Pro-Display',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap(40),
              ElevatedButton(
                  style: logbook.status == "Terverikasi"
                      ? buttonDisabled
                      : buttonPrimary,
                  onPressed: logbook.status == "Terverifikasi" ? null : () {},
                  child: const Text(
                    "Revisi",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
