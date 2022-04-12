import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskproject/presentation/screens/home_details_page.dart';
import '../../bussniess_logic/home_cubit.dart';
import '../../data/model/home_details_modle/arguments_home_details.dart';
import '../../data/model/home_modle/home_reponse.dart';
import '../common_widgets/appbar.dart';
import '../common_widgets/center_progress_bar.dart';
import '../common_widgets/list_common_widget.dart';
import '../common_widgets/no_internet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeResponse? homeResponse;
  bool isLoading = true;
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).fetchHomeData();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCommon(
          context,
          title: "Home Page",
        ),
        body: ConnectivityBuilder(
          builder: (BuildContext context, bool? isConnected,
              ConnectivityStatus? status) {
            if (isConnected == false) {
              return const NoInternetConnection();
            } else {
              return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                if (state is HomeLoaded) {
                  homeResponse = state.homeModel;
                  isLoading = false;
                }
                return isLoading == true
                    ? const CenterCircularProgressbar(
                        submitProgressVisibility: true,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: homeResponse!.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HomePageDetails(),
                                      // Pass the arguments as part of the RouteSettings. The
                                      // DetailProject reads the arguments from these settings.
                                      settings: RouteSettings(
                                        arguments: ArgumentDetailsProject(
                                            "${homeResponse!.data![index].description}",
                                            "${homeResponse!.data![index].name}",
                                            "${homeResponse!.data![index].thumb}"),
                                      ),
                                    ),
                                  );
                                },
                                child: ListCommonWidget(
                                    description:
                                        homeResponse!.data![index].name,
                                    supTitle: homeResponse!
                                        .data![index].description));
                          },
                        ));
              });
            }
          },
        ));
  }
}
