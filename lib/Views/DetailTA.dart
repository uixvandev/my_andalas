import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:my_andalas/Models/DetailTA_Model.dart';
import 'package:my_andalas/Models/LogbooksModel.dart';
import 'package:my_andalas/Services/Api.dart';
import 'package:my_andalas/Styles/Theme.dart';
import 'package:my_andalas/Views/AddLogbook.dart';
import 'package:my_andalas/Views/DetailLogbook.dart';

class DetailScreenTA extends StatelessWidget {
  final String id;
  final Api api = Api();

  late String supervisorId; // Declare supervisorId as late

  DetailScreenTA({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF008043)),
        title: const Text('Detail Tugas Akhir'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.plus),
            onPressed: () async {
              try {
                DetailTa detail = await api.getDetailThesis(id);

                // Assuming supervisors is a list of maps
                if (detail.thesis!.supervisors != null &&
                    detail.thesis!.supervisors!.isNotEmpty) {
                  supervisorId = detail.thesis!.supervisors![0]
                      ['id']; // Example: Get supervisor ID from the first map

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddLogbookForm(supervisorId: id),
                    ),
                  );
                } else {
                  // Handle case where no supervisors are found
                  print('No supervisors found for thesis $id');
                }
              } catch (e) {
                print('Error fetching supervisorId: $e');
                // Handle error as per your application's requirement
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<DetailTa>(
          future: api.getDetailThesis(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              DetailTa thesis = snapshot.data!;
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Card(
                        color: white,
                        elevation: 3,
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                "${thesis.thesis?.title}",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Abstrak: "${thesis.thesis?.thesisAbstract}"',
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Logbook',
                        style: TextStyle(
                          color: primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FutureBuilder(
                        future: Future.wait([api.getLogbooks(id)]),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Log>? listLogbook = snapshot.data![0];
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listLogbook?.length,
                              itemBuilder: (context, index) {
                                Log logbook = listLogbook![index];
                                return Card(
                                  color: white,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: ListTile(
                                    title: Text("Masalah: ${logbook.problem})"),
                                    subtitle: Text("${logbook.progress}"),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailScreenLogbook(log: logbook),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                                child: Text('Tidak ada logbook'));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('Tidak ada data'));
            }
          },
        ),
      ),
    );
  }
}
