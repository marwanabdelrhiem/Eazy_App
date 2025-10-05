import 'package:eazy_app/features/Lessons/Views/widgets/lessons_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/single_catgory_response.dart';
class DescribtionListView extends StatelessWidget {
   const DescribtionListView({super.key, required this.data});
   final List<Lessons> data;
   @override
  Widget build(BuildContext context) {
    return SliverList.builder(itemBuilder: (context,item){
      return Padding(
        padding:EdgeInsets.symmetric(vertical: 11.h),
        child: LessonsItem(
          data: data[item],
        ),
      );
    },itemCount:data.length);
  }
}
