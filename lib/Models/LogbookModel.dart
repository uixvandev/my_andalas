class Logbook {
  final int id;
  final String status;
  final String day;
  final String date;
  final String activity;
  final String notes;

  Logbook(
      {required this.id,
      required this.status,
      required this.day,
      required this.date,
      required this.activity,
      required this.notes});

  @override
  String toString() {
    return 'Logbook $id: $status, $day, $date, $activity, $notes';
  }
}

List<Logbook> logbookList = [
  Logbook(
      id: 1,
      status: "Terverifikasi",
      day: "Senin",
      date: "22 April 2024",
      activity:
          "Bertemu dengan pembimbing akademik untuk diskusi mengenai kerangka kerja tugas akhir. Menyusun daftar referensi dan literatur yang relevan dengan topik penelitian. Membuat outline proposal tugas akhir.",
      notes:
          "Diskusi dengan pembimbing akademik menghasilkan arahan yang jelas mengenai fokus penelitian yang harus diambil."),
  Logbook(
      id: 2,
      status: "Tidak Terverifikasi",
      day: "Selasa",
      date: "23 April 2024",
      activity:
          "Melakukan studi literatur tentang metode penelitian yang sesuai dengan topik tugas akhir. Membaca beberapa jurnal terkait dan mencatat poin-poin penting.",
      notes:
          "Studi literatur memberikan pemahaman yang lebih mendalam tentang penelitian yang telah dilakukan sebelumnya."),
  Logbook(
      id: 3,
      status: "Belum Terverifikasi",
      day: "Rabu",
      date: "24 April 2024",
      activity:
          "Mengumpulkan data primer melalui wawancara dengan responden yang relevan. Membuat pertanyaan-pertanyaan yang sesuai dengan tujuan penelitian.",
      notes:
          "Wawancara memberikan perspektif langsung dari responden yang dapat mendukung penelitian ini."),
  Logbook(
      id: 4,
      status: "Belum Terverifikasi",
      day: "Kamis",
      date: "25 April 2024",
      activity:
          "Menganalisis data yang telah dikumpulkan. Menggunakan metode analisis yang sesuai dengan tujuan penelitian.",
      notes:
          "Analisis data memberikan informasi yang relevan untuk menjawab pertanyaan penelitian."),
  Logbook(
      id: 5,
      status: "Belum Terverifikasi",
      day: "Jumat",
      date: "26 April 2024",
      activity:
          "Menulis bab pendahuluan dan latar belakang tugas akhir. Menyusun kerangka penulisan yang sesuai dengan format yang ditentukan.",
      notes:
          "Pendahuluan dan latar belakang menjadi landasan teoritis yang kuat untuk penelitian ini."),
  Logbook(
      id: 6,
      status: "Belum Terverifikasi",
      day: "Sabtu",
      date: "27 April 2024",
      activity:
          "Melakukan presentasi proposal tugas akhir kepada dosen pembimbing. Menerima masukan dan saran untuk perbaikan proposal.",
      notes:
          "Presentasi proposal membantu dalam memperbaiki proposal tugas akhir sebelum tahap penelitian dimulai."),
  Logbook(
      id: 7,
      status: "Belum Terverifikasi",
      day: "Minggu",
      date: "28 April 2024",
      activity:
          "Mengumpulkan data sekunder melalui studi pustaka dan penelusuran internet. Menyimpan referensi yang relevan untuk analisis selanjutnya.",
      notes:
          "Data sekunder memberikan informasi tambahan yang mendukung penelitian ini."),
  Logbook(
      id: 8,
      status: "Belum Terverifikasi",
      day: "Senin",
      date: "29 April 2024",
      activity:
          "Menganalisis data sekunder yang telah dikumpulkan. Mengidentifikasi pola dan tren yang muncul dari data tersebut.",
      notes:
          "Analisis data sekunder memberikan wawasan yang lebih luas tentang topik penelitian."),
  Logbook(
      id: 9,
      status: "Belum Terverifikasi",
      day: "Selasa",
      date: "30 April 2024",
      activity:
          "Menulis bab metode penelitian. Menjelaskan langkah-langkah yang akan diambil dalam penelitian ini.",
      notes:
          "Bab metode penelitian memberikan panduan yang jelas tentang proses penelitian yang akan dilakukan."),
  Logbook(
      id: 10,
      status: "Belum Terverifikasi",
      day: "Rabu",
      date: "1 Mei 2024",
      activity:
          "Melakukan eksperimen atau pengumpulan data tambahan sesuai dengan metode penelitian yang telah ditentukan.",
      notes:
          "Eksperimen memberikan bukti empiris yang mendukung temuan penelitian ini."),
  Logbook(
      id: 11,
      status: "Belum Terverifikasi",
      day: "Kamis",
      date: "2 Mei 2024",
      activity:
          "Menganalisis data eksperimen atau data tambahan yang telah dikumpulkan. Menggunakan teknik analisis yang sesuai.",
      notes:
          "Analisis data eksperimen memberikan hasil yang dapat diinterpretasikan untuk menjawab pertanyaan penelitian."),
  Logbook(
      id: 12,
      status: "Belum Terverifikasi",
      day: "Jumat",
      date: "3 Mei 2024",
      activity:
          "Menulis bab hasil penelitian. Menyajikan temuan-temuan yang diperoleh dari analisis data.",
      notes:
          "Bab hasil penelitian memberikan informasi tentang apa yang telah ditemukan dalam penelitian ini."),
  Logbook(
      id: 13,
      status: "Belum Terverifikasi",
      day: "Sabtu",
      date: "4 Mei 2024",
      activity:
          "Menulis bab pembahasan. Menganalisis temuan penelitian dan menghubungkannya dengan teori yang relevan.",
      notes:
          "Bab pembahasan memberikan interpretasi dan analisis mendalam tentang temuan penelitian."),
  Logbook(
      id: 14,
      status: "Belum Terverifikasi",
      day: "Minggu",
      date: "5 Mei 2024",
      activity:
          "Menulis bab kesimpulan dan saran. Merangkum temuan penelitian dan memberikan rekomendasi untuk penelitian selanjutnya.",
      notes:
          "Bab kesimpulan dan saran memberikan ringkasan dari penelitian ini dan memberikan arahan untuk penelitian masa depan."),
  Logbook(
      id: 15,
      status: "Belum Terverifikasi",
      day: "Senin",
      date: "6 Mei 2024",
      activity:
          "Mengedit dan merevisi keseluruhan laporan tugas akhir. Memperbaiki struktur, tata bahasa, dan kesalahan lainnya.",
      notes:
          "Proses editing dan revisi memastikan laporan tugas akhir menjadi lebih baik sebelum diserahkan."),
  Logbook(
      id: 16,
      status: "Belum Terverifikasi",
      day: "Selasa",
      date: "7 Mei 2024",
      activity:
          "Menyelesaikan laporan tugas akhir. Menyusun daftar pustaka dan melampirkan semua referensi yang digunakan.",
      notes:
          "Penyelesaian laporan tugas akhir menandai akhir dari penelitian ini dan persiapan untuk presentasi akhir."),
  Logbook(
      id: 17,
      status: "Belum Terverifikasi",
      day: "Rabu",
      date: "8 Mei 2024",
      activity:
          "Melakukan presentasi akhir tugas akhir kepada dosen pembimbing dan penguji. Menyampaikan temuan penelitian dan menjawab pertanyaan.",
      notes:
          "Presentasi akhir merupakan kesempatan untuk mempresentasikan hasil penelitian dan mendapatkan umpan balik dari dosen pembimbing dan penguji."),
];
