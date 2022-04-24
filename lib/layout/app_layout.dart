import 'package:ajath_app/layout/cubit/states/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubti/cubit.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 2,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
