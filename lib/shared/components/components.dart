import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Widget defaultFormField(
    BuildContext context, {
      required TextEditingController controller,
      required TextInputType type,
      required String label,
      final VoidCallback? onTab,

    }) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onTap: onTab,
      onFieldSubmitted: (String value) {
       //TODO
      },
      decoration: InputDecoration(
        prefixIcon:  Icon(
          Icons.search,
          size: 30,
          color:Colors.deepPurpleAccent[100],
        ),
        labelText: label,
        suffixIcon: Icon(
            Icons.add_road_sharp,
          color:Colors.deepPurpleAccent[100],

        ),
        labelStyle: TextStyle(
          color: Colors.deepPurpleAccent[100],
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.03,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
// End default Form

Widget buildHeads(title,size)=>Padding(
  padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      Text(
        'See all',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        "(55)",
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  ),
);