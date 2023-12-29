import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/search.dart';
import '../shared/compants.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              actions: [
                IconButton(onPressed: () {
                  navigateTo(context, SearchScreen());
                }, icon: Icon(Icons.search)),
                IconButton(onPressed: (){
                  cubit.changeMode();
                  cubit.getBusiness();
                  cubit.getSports();
                  cubit.getScience();
                },
                    icon:Icon(Icons.brightness_4_outlined)
                    ) ,
              ],
            ),
            floatingActionButton: FloatingActionButton(onPressed: () {},
              child: Icon(Icons.add),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      );

  }}
