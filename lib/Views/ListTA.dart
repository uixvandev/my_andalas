import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_andalas/Models/TA_Model.dart';
import 'package:my_andalas/Models/TopicsModel.dart';
import 'package:my_andalas/Services/Api.dart';
import 'package:my_andalas/Styles/Theme.dart';
import 'package:my_andalas/Views/DetailTA.dart';

class ListTa extends StatelessWidget {
  ListTa({super.key});
  final Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF008043)),
        title: const Text(
          'Daftar Tugas Akhir',
          style: TextStyle(
            fontFamily: 'SF-Pro-Display',
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: const Color(0xFFE5E5E5),
              height: 1.0,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _daftarTA(api),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _daftarTA(Api api) => FutureBuilder(
    future: Future.wait([
      api.getTheses(),
      api.getTopics(),
    ]),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<Thesis> listTheses = snapshot.data![0] as List<Thesis>;
        List<Datum>? listTopics = snapshot.data![1] as List<Datum>?;
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // itemCount: taList.length,
                      itemCount: listTheses.length,
                      itemBuilder: (BuildContext context, index) {
                        final theses = listTheses[index];
                        Datum? topic;
                        if (listTopics != null && index < listTopics.length) {
                          topic = listTopics[index];
                        }
                        return Card(
                          color: Colors.white,
                          shadowColor: Colors.black.withOpacity(0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              leading: const Image(
                                image: AssetImage('assets/images/ta2.png'),
                              ),
                              title: Text(
                                theses.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              subtitle: Column(
                                children: [
                                  const Gap(4),
                                  Row(
                                    children: [
                                      UnconstrainedBox(
                                        child: Container(
                                          height: 24,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: ShapeDecoration(
                                            color: const Color(0x3300C572),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                topic?.name ?? 'Unknown',
                                                style: const TextStyle(
                                                  color: Color(0xFF008042),
                                                  fontSize: 11,
                                                  fontFamily: 'SF Pro',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreenTA(
                                              id: listTheses[index].id,
                                            )));
                              },
                            ),
                          ),
                        );
                      }),
                )
              ],
            ));
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
