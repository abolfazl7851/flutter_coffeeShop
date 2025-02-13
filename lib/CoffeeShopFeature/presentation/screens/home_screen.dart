import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coffee_shop/CoffeeShopFeature/data/models/coffee_model.dart';
import 'package:coffee_shop/CoffeeShopFeature/presentation/bloc/Home/home_bloc.dart';
import 'package:coffee_shop/CoffeeShopFeature/presentation/bloc/Home/home_status.dart';
import 'package:coffee_shop/screens/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../widgets/item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late CoffeeModel coffeeModel;

  @override
  void initState() {
    coffeeModel = CoffeeModel();
    BlocProvider.of<HomeBloc>(context).add(LoadHomeEvent(coffeeModel));
  }

  @override
  Widget build(BuildContext context) {
    List<String> choices = [
      'Hot Coffee',
      'Cappuccino',
      'Cold Coffee',
      'Americano'
    ];

    late TabController tabController =
        TabController(length: choices.length, vsync: this);

    final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();

    ScrollController scrollController =
        ScrollController(initialScrollOffset: 0);

    return WillPopScope(
      onWillPop: () async {
        if (scrollController.offset != 0) {
          scrollController.animateTo(0,
              duration: const Duration(seconds: 1), curve: Curves.easeInOut);
          return false;
        }
        return true;
      },
      child: Container(
        color: const Color(0xFF212325),
        child: RefreshIndicator(
          key: refreshIndicatorKey,
          color: Colors.orange,
          backgroundColor: Colors.transparent,
          strokeWidth: 3.0,
          onRefresh: () async {
            // Replace this delay with the code to be executed during refresh
            // and return a Future when code finishes execution.
            coffeeModel = CoffeeModel();
            BlocProvider.of<HomeBloc>(context).add(LoadHomeEvent(coffeeModel));
            return Future<void>.delayed(const Duration(milliseconds: 0));
          },
          child: CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        "It's a Great Day for Coffee",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TabBar(
                        controller: tabController,
                        labelColor: Colors.orange,
                        unselectedLabelColor: Colors.white.withOpacity(0.3),
                        isScrollable: true,
                        indicator: const UnderlineTabIndicator(
                            borderSide:
                                BorderSide(width: 3, color: Colors.orange),
                            insets: EdgeInsets.symmetric(horizontal: 16)),
                        labelStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 14),
                        tabs: List.generate(
                            choices.length,
                            (index) => Tab(
                                  text: choices[index],
                                ))),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(buildWhen: (previous, current) {
                if (previous.status == current.status) {
                  return false;
                }
                return true;
              }, builder: (context, state) {
                if (state.status is HomeStatusLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: CircularProgressIndicator(
                          color: Colors.orange,
                          strokeWidth: 3,
                        ),
                      ),
                    ),
                  );
                }

                /// show Error State for Cw
                if (state.status is HomeStatusError) {
                  final HomeStatusError homeError =
                      state.status as HomeStatusError;

                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    // _formKey.currentState?.save();
                    List<String> errors = homeError.message;
                    if (errors.isNotEmpty) {
                      for (var error in errors) {
                        ShowError(error);
                      }
                    }
                  });

                  return SliverToBoxAdapter(
                      child: Container(
                          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset("images/animation_connectionError.json",
                          width: 300,
                          height: 300,
                          fit: BoxFit.fitWidth,
                          repeat: true,
                          alignment: Alignment.center),
                      const SizedBox(height: 5,),
                      // InkWell(
                      //   onTap: (){
                      //     coffeeModel = CoffeeModel();
                      //     BlocProvider.of<HomeBloc>(context).add(LoadHomeEvent(coffeeModel));
                      //   },
                      //   child: Container(
                      //       height: 50,
                      //       width: 50,
                      //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.orange),
                      //       child: const Icon(
                      //         CupertinoIcons.refresh,
                      //         size: 35,
                      //         color: Colors.white,
                      //       )),
                      // )

                    ],
                  )));
                }

                if (state.status is HomeStatusCompleted) {
                  final HomeStatusCompleted homeCompleted =
                      state.status as HomeStatusCompleted;
                  return ItemWidget(coffees: homeCompleted.coffees);
                }

                return Container();
              })
            ],
          ),
        ),
      ),
    );
  }

  ShowError(String error) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!!!',
        message: error,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
