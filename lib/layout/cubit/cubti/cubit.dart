import 'package:ajath_app/layout/cubit/states/states.dart';
import 'package:ajath_app/models/home_model.dart';
import 'package:ajath_app/modules/chat_screen.dart';
import 'package:ajath_app/modules/discussions.dart';
import 'package:ajath_app/modules/home_screen.dart';
import 'package:ajath_app/modules/more_screen.dart';
import 'package:ajath_app/modules/search_screen.dart';
import 'package:ajath_app/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  // start handle  BottomNav
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.group_outlined,
      ),
      label: 'Discussions',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.chat_bubble_outline,
      ),
      label: 'Chat',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
      ),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.more_horiz_outlined,
      ),
      label: 'More',
    ),
  ];
  List<Widget> screens = [
    HomeScreen(),
    const Discussions(),
    const ChatScreen(),
    const SearchScreen(),
    const MoreScreen(),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavStates());
  }
  // End BottomNav
//Start get data Home Model
  HomeModel? homeModel;
  void getHomeData(){
    emit(AppLoadingGetDataState());
    DioHelper.getData(
        url: 'https://app.fakejson.com/q/xdqGGa4e?token=MmSjTp1p8t-exolhzJqYlg',
    ).then((value){
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel!.categoies!.dataModel!.first.name);
      print(homeModel!.tutors);
      emit(AppSuccessGetDataState());
    }).catchError((error){
      print(error.toString());
      emit(AppErrorGetDataState());
    });
  }
//end get data Home Model
}












