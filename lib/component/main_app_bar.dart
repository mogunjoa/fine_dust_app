import 'package:flutter/material.dart';

import '../const/colors.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
    );

    return SliverAppBar(
      backgroundColor: primaryColor,
      collapsedHeight: 600,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            color: Colors.black,
            margin: EdgeInsets.only(top: 100),
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
                  DateTime.now().toString(),
                  style: ts.copyWith(
                    fontSize: 20.0,
                  ),
                ),
                Image.asset(
                    'asset/img/mediocre.png',
                     height: MediaQuery.of(context).size.width / 2,
                ),
                SizedBox(height: 20.0,),
                Text(
                  '보통',
                  style: ts.copyWith(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 8.0,),
                Text(
                  '나쁘지 않네요!',
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
}

