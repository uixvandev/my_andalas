import 'package:flutter/material.dart';

Map<String, Map<String, dynamic>> statusStyles = {
  'Terverifikasi': {
    'color': const Color(0xFF008042),
    'backgroundColor': const Color(0x3300C572),
    'borderRadius': BorderRadius.circular(24),
  },
  'Tidak Terverifikasi': {
    'color': const Color(0xFFFF0000),
    'backgroundColor': const Color(0x33FF0000),
    'borderRadius': BorderRadius.circular(24),
  },
  'Belum Terverifikasi': {
    'color': const Color(0xFFFFA500),
    'backgroundColor': const Color(0x33FFA500),
    'borderRadius': BorderRadius.circular(24),
  },
};
