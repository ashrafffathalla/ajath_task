import 'package:ajath_app/layout/cubit/states/states.dart';
import 'package:ajath_app/models/home_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../layout/cubit/cubti/cubit.dart';
import '../shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  var searchController = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return BlocProvider(
      create: (BuildContext context) =>
      AppCubit()
        ..getHomeData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! AppLoadingGetDataState,
            builder: (context) =>
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.06,
                          horizontal: size.width * 0.05,
                        ),
                        child: defaultFormField(
                          context,
                          controller: searchController,
                          type: TextInputType.text,
                          label: 'Find Course',
                        ),
                      ),
                      buildHeads('Popular Courses', size),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Container(
                        height: size.height * 0.36,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildPopularCourses(
                                size,

                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                          itemCount: AppCubit
                              .get(context)
                              .homeModel!
                              .popularCourses!
                              .dataModel!
                              .length,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      buildHeads('Category', size),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: size.height * 0.15,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildCategoryWidget(
                                size,
                                AppCubit
                                    .get(context)
                                    .homeModel!
                                    .categoies!
                                    .dataModel![index],
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(
                                width: size.width * 0,
                              ),
                          itemCount: AppCubit
                              .get(context)
                              .homeModel!
                              .categoies!
                              .dataModel!
                              .length,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      buildHeads('Top Tutors', size),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: size.height * 0.15,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildTopTutors(
                                size,
                                //AppCubit.get(context)
                                // .homeModel!
                                // .categoies!
                                // .dataModel![index],


                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(
                                width: size.width * 0,
                              ),
                          itemCount: 5, //AppCubit.get(context)
                          //     .homeModel!
                          //     .categoies!
                          //     .dataModel!
                          //     .length,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                    ],
                  ),
                ),
            fallback: (context) =>
            const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  //Start build PopularCourses
  Widget buildPopularCourses(size,) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03,
        ),
        child: Stack(
          children: [
            Container(
              width: size.width * 0.9,
              height: size.height / 2.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: size.width * 0.88,
                    height: size.height * 0.13,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.height * 0.003,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ultimate Digital Marketing Course',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'By Anna johason',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.002,
                          ),
                          Row(
                            children: [
                              Container(
                                width: size.width * 0.23,
                                height: size.height * 0.035,
                                child: Center(
                                  child: Text(
                                    'Bestseller',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "\$",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                ),
                              ),
                              Text(
                                "300",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.016,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.orangeAccent,
                              ),
                              Text(
                                '4.5',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                " (21)",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            Positioned(
              top: 0,
              child: Padding(
                padding: const EdgeInsets.all(3.5),
                child: Container(
                  width: size.width * 0.88,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://img.freepik.com/free-vector/red-heart-with-heartbeat-line-medical-background_1017-26835.jpg?t=st=1650759858~exp=1650760458~hmac=e2d3fa988941f64006cb7102b069dc972b37737fc3480e56218f298ba82e4a1a&w=740',
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      );

  //end build PopularCourses

  //Start buildCategoryWidget
  Widget buildCategoryWidget(size, DataModel dataModelModel) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03,
        ),
        child: Container(
          width: size.width * 0.3,
          height: size.height * 0.14,
          child: Container(
            width: size.width * 0.3,
            height: size.height * 0.14,
            child: Center(
                child: Text(
                  dataModelModel.name!,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red.withOpacity(0.7),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                dataModelModel.image!,
              ),
            ),
          ),
        ),
      );

//end buildCategoryWidget
//start buildTopTutors
  Widget buildTopTutors(size) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1650764016~exp=1650764616~hmac=a69a262463cacdd800e9cb071ad20c2d100a152e284f4e48e8a459639d082add&w=740'),
              radius: 30,
            ),
          ],
        ),
      );
//end buildTopTutors
}
