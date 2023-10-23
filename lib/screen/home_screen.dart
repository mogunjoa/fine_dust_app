import 'package:fine_dust_app/component/category_card.dart';
import 'package:fine_dust_app/component/hourly_card.dart';
import 'package:fine_dust_app/component/main_app_bar.dart';
import 'package:fine_dust_app/component/main_drawer.dart';
import 'package:fine_dust_app/const/colors.dart';
import 'package:fine_dust_app/const/status_level.dart';
import 'package:fine_dust_app/model/stat_model.dart';
import 'package:fine_dust_app/repository/stat_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<StatModel>> fetchData() async {
    final statModels = await StatRepository.fetchData();

    return statModels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MainDrawer(),
      body: FutureBuilder<List<StatModel>>(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('에러가 있습니다.'),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<StatModel> stats = snapshot.data!;
          StatModel recentStat = stats[0];

          final status = statusLevel.where(
            (element) => element.minFinDust < recentStat.seoul,
          ).last;

          return CustomScrollView(
            slivers: [
              MainAppBar(
                stat: recentStat,
                status: status,
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CategoryCard(),
                    const SizedBox(
                      height: 16.0,
                    ),
                    HourlyCard(),
                  ],
                ),
              ),
            ],
          );
        },
        future: fetchData(),
      ),
    );
  }
}
