import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:my_andalas/Models/ProfileModel.dart';
import 'package:my_andalas/Models/TA_Model.dart';
import 'package:my_andalas/Models/TopicsModel.dart';
import 'package:my_andalas/Services/Api.dart';
import 'package:my_andalas/Styles/Theme.dart';
import 'package:my_andalas/Views/DetailTA.dart';
import 'package:my_andalas/Views/ListTA.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _userInfo(),
              _cardInfo(),
              _daftarTA(),
              // _historyLogbook(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _userInfo() => FutureBuilder<Data?>(
        future: api.getProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Data? profile = snapshot.data;
            print(jsonEncode(profile));
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/avatar.png'),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile?.name ?? "-", // Display user name
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF-Pro-Display',
                            ),
                          ),
                          Text(
                            profile?.nim ?? "-", // Display student ID
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'SF-Pro-Display',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        IconlyLight.notification,
                        color: Color(0xFF008042),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: Error profile ${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );

  Widget _cardInfo() => FutureBuilder(
        future: Future.wait([
          api.getTheses(),
          api.getTopics(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Thesis> listTheses = snapshot.data![0] as List<Thesis>;
            List<Datum>? listTopics = snapshot.data![1] as List<Datum>?;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              padding: const EdgeInsets.all(16),
              height: 150,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xFF00A154), Color(0xFF003A1E)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 329,
                        height: 56,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              child: Text(
                                "Seminar Hasil",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'SF-Pro-Display',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              width: 132,
                              height: 40,
                              padding: const EdgeInsets.all(8),
                              decoration: ShapeDecoration(
                                color: const Color(0xFF008042),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset('assets/icons/Calendar.svg'),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text(
                                    "10 April 2023",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'SF-Pro-Display',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 400,
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset("assets/icons/Check.svg"),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "List TA",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "${listTheses.length}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset("assets/icons/Line.svg"),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset("assets/icons/Check.svg"),
                              ],
                            ),
                            const SizedBox(width: 8),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Logbook Selesai",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "12",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Handle the case where snapshot.hasData is false
            return const Center(child: CircularProgressIndicator());
          }
        },
      );

  Widget _daftarTA() => FutureBuilder(
      future: Future.wait([
        api.getTheses(),
        api.getTopics(),
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Thesis> listTheses = snapshot.data![0] as List<Thesis>;
          List<Datum>? listTopics = snapshot.data![1] as List<Datum>?;
          return Flexible(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Daftar TA",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          child: const Text(
                            "Lihat semua",
                            style: TextStyle(
                              color: Color(0xFF008042),
                              fontSize: 16,
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListTa()));
                          },
                        ),
                      ],
                    ),
                    const Gap(16),
                    Flexible(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // itemCount: taList.length,
                          itemCount: listTheses.length,
                          itemBuilder: (BuildContext context, index) {
                            final theses = listTheses[index];
                            Datum? topic;
                            if (listTopics != null &&
                                index < listTopics.length) {
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                            builder: (context) =>
                                                DetailScreenTA(
                                                  id: listTheses[index].id,
                                                )));
                                  },
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                )),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });

  // Column _listTile({required String title, required double itemHeight}) {
  //   return
  // }

  // Widget _historyLogbook(BuildContext context) => Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
  //       child: _listLogbook(
  //           title: "Riwayat Logbook", itemHeight: 490, context: context),
  //     );

  // Column _listLogbook(
  //     {required String title,
  //     required double itemHeight,
  //     required BuildContext context}) {
  //   return Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Text(
  //             title,
  //             style: const TextStyle(
  //               color: Colors.black,
  //               fontSize: 16,
  //               fontFamily: 'SF Pro',
  //               fontWeight: FontWeight.w400,
  //               height: 0.09,
  //             ),
  //           ),
  //           InkWell(
  //             child: const Text(
  //               "Lihat Semua",
  //               style: TextStyle(
  //                 color: Color(0xFF008042),
  //                 fontSize: 16,
  //                 fontFamily: 'SF Pro',
  //                 fontWeight: FontWeight.w400,
  //               ),
  //             ),
  //             onTap: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const Listlogbook()));
  //             },
  //           )
  //         ],
  //       ),
  //       const Gap(8),
  //       SizedBox(
  //         height: itemHeight,
  //         child: ListView.builder(
  //             physics: const NeverScrollableScrollPhysics(),
  //             // itemCount: taList.length,
  //             itemCount: 4,
  //             itemBuilder: (BuildContext context, index) {
  //               return Card(
  //                 color: Colors.white,
  //                 shadowColor: Colors.black.withOpacity(0),
  //                 child: Container(
  //                   decoration: BoxDecoration(
  //                     color: white,
  //                     borderRadius: BorderRadius.circular(8),
  //                   ),
  //                   child: ListTile(
  //                     contentPadding: const EdgeInsets.symmetric(horizontal: 8),
  //                     title: Column(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           logbookList[index].day,
  //                           style: const TextStyle(
  //                             fontSize: 14,
  //                             fontFamily: 'SF Pro',
  //                             fontWeight: FontWeight.w700,
  //                           ),
  //                         ),
  //                         Text(
  //                           logbookList[index].date,
  //                           style: const TextStyle(
  //                             fontSize: 12,
  //                             fontFamily: 'SF Pro',
  //                             fontWeight: FontWeight.w700,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     subtitle: Column(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         RichText(
  //                           maxLines: 2,
  //                           overflow: TextOverflow.ellipsis,
  //                           text: TextSpan(
  //                             children: [
  //                               TextSpan(
  //                                 text: logbookList[index].activity,
  //                                 style: const TextStyle(
  //                                     fontSize: 12, color: Colors.black),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         const Gap(8),
  //                         Row(
  //                           children: [
  //                             UnconstrainedBox(
  //                               child: Container(
  //                                 width: 120,
  //                                 height: 24,
  //                                 padding: const EdgeInsets.symmetric(
  //                                     horizontal: 8, vertical: 4),
  //                                 decoration: ShapeDecoration(
  //                                   color:
  //                                       statusStyles[logbookList[index].status]
  //                                           ?['backgroundColor'],
  //                                   shape: RoundedRectangleBorder(
  //                                     borderRadius: BorderRadius.circular(24),
  //                                   ),
  //                                 ),
  //                                 child: Row(
  //                                   mainAxisAlignment: MainAxisAlignment.center,
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   children: [
  //                                     Text(
  //                                       logbookList[index].status,
  //                                       style: TextStyle(
  //                                         color: statusStyles[logbookList[index]
  //                                             .status]?['color'],
  //                                         fontSize: 11,
  //                                         fontFamily: 'SF Pro',
  //                                         fontWeight: FontWeight.w400,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                     onTap: () {
  //                       Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) => DetailScreenLogbook(
  //                                   logbook: logbookList[index])));
  //                     },
  //                   ),
  //                 ),
  //               );
  //             }),
  //       )
  //     ],
  //   );
  // }
}
