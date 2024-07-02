import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:my_andalas/Models/LogbookModel.dart';
import 'package:my_andalas/Styles/Theme.dart';
import 'package:my_andalas/Styles/style.dart';
import 'package:my_andalas/Views/AddLogbook.dart';
import 'package:my_andalas/Views/DetailLogbook.dart';

class Listlogbook extends StatelessWidget {
  const Listlogbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF008043)),
        title: const Text(
          ' Logbook',
          style: TextStyle(
            fontFamily: 'SF-Pro-Display',
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddLogbook()));
              },
              icon: const Icon(IconlyLight.plus))
        ],
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
              _taInfo(),
              const _listView(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _taInfo() => const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Judul TA : Aplikasi Panduan Self Driving Berbasis mobile apps untuk penyandang Disabilitas tuna netra',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text('Application Entreprise',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: 'SF-Pro-Display',
                    )),
              ],
            ),
          ),
        ],
      ),
    );

class _listView extends StatelessWidget {
  const _listView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        itemCount: logbookList.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
            shadowColor: Colors.black.withOpacity(0),
            child: Container(
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      logbookList[index].day,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      logbookList[index].date,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'SF-Pro-Display',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: logbookList[index].activity,
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'SF-Pro-Display',
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const Gap(0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UnconstrainedBox(
                          child: Container(
                            width: 120,
                            height: 24,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: ShapeDecoration(
                              color: statusStyles[logbookList[index].status]
                                  ?['backgroundColor'],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  logbookList[index].status,
                                  style: TextStyle(
                                    color:
                                        statusStyles[logbookList[index].status]
                                            ?['color'],
                                    fontSize: 11,
                                    fontFamily: 'SF-Pro-Display',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              IconlyLight.danger,
                              color: Color(0xFF008043),
                            ))
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreenLogbook(
                              logbook: logbookList[index])));
                },
              ),
            ),
          );
        });
  }
}
