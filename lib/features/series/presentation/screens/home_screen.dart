import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inova_task/features/series/presentation/cubit/series_cubit.dart';
import 'package:inova_task/features/series/presentation/screens/tabs/classes_tab.dart';
import 'package:inova_task/features/series/presentation/screens/tabs/community_tab.dart';
import 'package:inova_task/features/series/presentation/screens/tabs/overview_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  _getSeries() => context.read<SeriesCubit>().getSeries();

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    _getSeries();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: BlocBuilder<SeriesCubit, SeriesState>(
          builder: (context, state) {
            if (state is SeriesIsLoading) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: Colors.greenAccent,
                ),
              );
            } else if (state is SeriesLoaded) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 200,
                    collapsedHeight: 80,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        'assets/images/trainer.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    floating: false,
                    pinned: false,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Center(
                          child: Text(
                            state.series.seriesName,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text(
                            state.series.instructors[0].name ?? '',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          color: Colors.black,
                          alignment: Alignment.center,
                          height: 56,
                          margin: const EdgeInsets.symmetric(horizontal: 100),
                          child: const Text(
                            'start practicing',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TabBar(
                          controller: tabController,
                          indicatorColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.black,
                          onTap: (_) {
                            setState(() {});
                          },
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: const [
                            Tab(text: 'overview'),
                            Tab(text: 'classes'),
                            Tab(text: 'community'),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (tabController.index == 0) ...{
                          OverViewTab(
                            series: state.series,
                          ),
                        } else if (tabController.index == 1) ...{
                          ClassesTab(
                            series: state.series,
                          ),
                        } else ...{
                          CommunityTab(
                            series: state.series,
                          ),
                        },
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: SpinKitFadingCircle(
                  color: Colors.greenAccent,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
