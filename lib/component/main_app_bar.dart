import 'package:fine_dust_app/model/stat_model.dart';
import 'package:fine_dust_app/model/status_model.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final StatusModel status;
  final StatModel stat;

  const MainAppBar({super.key, required this.status, required this.stat});

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
    );

    return SliverAppBar(
      backgroundColor: status.primaryColor,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                Text(
                  '서울',
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  getTimeFromDateTime(dateTime: stat.dataTime),
                  style: ts.copyWith(
                    fontSize: 20.0,
                  ),
                ),
                Image.asset(
                    status.imagePath,
                     height: MediaQuery.of(context).size.width / 2,
                ),
                SizedBox(height: 20.0,),
                Text(
                  status.label,
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 8.0,),
                Text(
                  status.comment,
                  style: ts.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getTimeFromDateTime({required DateTime dateTime}) {
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} ${getTimeFormat(dateTime.hour)}:${getTimeFormat(dateTime.minute)}';
  }

  String getTimeFormat(int number) {
    return number.toString().padLeft(2, '0');
  }
}

