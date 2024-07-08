import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:my_andalas/Models/SeminarModel.dart';
import 'package:my_andalas/Models/TA_Model.dart';
import 'package:my_andalas/Models/TopicsModel.dart';
import 'package:my_andalas/Services/Api.dart';
import 'package:my_andalas/Styles/Theme.dart';
import 'package:my_andalas/Views/DetailTA.dart';

class SeminarsPage extends StatelessWidget {
  SeminarsPage({super.key});
  final Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Color(0xFF008043)),
        title: const Text(
          'Jadwal Seminar',
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
              _seminars(api),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _seminars(Api api) => FutureBuilder(
    future: Future.wait([
      api.getSeminars(),
    ]),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        print(snapshot.data);
        List<seminarData> listSeminar = snapshot.data![0];
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
                      itemCount: listSeminar.length,
                      itemBuilder: (BuildContext context, index) {
                        final seminar = listSeminar[index];
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
                                image: AssetImage('assets/images/ta1.png'),
                              ),
                              title: Text(
                                seminar.description,
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
                                                "${DateFormat('dd MMMM yyyy').format(seminar.seminarAt)}",
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
                              onTap: () {},
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
