import 'package:fine_dust_app/component/category_card.dart';
import 'package:fine_dust_app/component/main_app_bar.dart';
import 'package:fine_dust_app/component/main_drawer.dart';
import 'package:fine_dust_app/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CategoryCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
